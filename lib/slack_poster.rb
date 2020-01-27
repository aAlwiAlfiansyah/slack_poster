#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'slack_poster/network_request.rb'

# Send message and upload file to slack
class SlackPoster
  URL = 'https://slack.com/api/'

  def initialize(network_request)
    @network_request = network_request
  end

  def post_message(channel_id, message, token)
    url = "#{URL}chat.postMessage"
    escaped_message = escape_newline(message)
    @network_request.post(url, { token: token }, 'channel' => channel_id, 'text' => escaped_message)
  end

  def escape_newline(message)
    new_message = message.gsub('%0A', "\n")
    # new_message = new_message.gsub('0x0A', "\n")
    # new_message = new_message.gsub('\n', "\n")
    new_message
  end
end
