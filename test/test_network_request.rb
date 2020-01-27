# frozen_string_literal: true

require_relative 'test_helper.rb'
require_relative '../lib/slack_poster/network_request.rb'
require 'webmock/test_unit'

# test_network_request.rb
class NetworkRequestTest < Test::Unit::TestCase
  def test_get_request
    url = 'https://api.github.com/repos/bukalapak/bukalapak_android/pulls?head=bukalapak:ruby-test'
    params = { head: 'bukalapak:ruby-test' }
    header = { headers: {
      'Accept' => '*/*',
      'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent' => 'Ruby'
    } }
    response = {
      body: { 'url' => 'https://api.github.com/repos/bukalapak/bukalapak_android/pulls/16513' }
    }
    stub_request(:get, url)
      .with(header)
      .to_return(status: 200, body: response[:body].to_json, headers: {})
    message = "Result body should be json #{response[:body]}"
    actual = NetworkRequest.new.request(url, params, header)
    expected = response[:body]
    assert_equal expected, actual, message
  end
end