#!/usr/bin/env ruby

# frozen_string_literal: true

require 'net/http'
require 'uri'
require 'json'

# Helper class for network request like simple bash curl
class NetworkRequest
  def request(url, params, headers = [], method = 'Get')
    uri = URI.parse(url)
    uri.query = URI.encode_www_form(params)
    req_method = Object.const_get "Net::HTTP::#{method}"
    request = req_method.new(uri.request_uri)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')
    headers.each do |key, value|
      request[key] = value
    end
    response = http.request(request)
    JSON.parse(response.body)
  end

  # Simple post
  def post(url, params, payload)
    uri = URI.parse(url)
    uri.query = URI.encode_www_form(params)
    Net::HTTP.post_form(uri, payload)
  end
end

# Mock of NetworkRequest class
class MockedNetworkRequest
  def request(url, params, headers = [], method = 'Get')
    @uri = URI.parse(url)
    @uri.query = URI.encode_www_form(params)
    @req_method = Object.const_get "Net::HTTP::#{method}"
    @headers = headers
  end

  # Simple post
  def post(url, params, payload)
    @uri = URI.parse(url)
    @uri.query = URI.encode_www_form(params)
    @req_method = Object.const_get 'Net::HTTP::Post'
    @payload = payload
  end
end
