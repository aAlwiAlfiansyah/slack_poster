#!/usr/bin/env ruby

# frozen_string_literal: true

require_relative 'test_helper.rb'
require_relative '../lib/slack_poster.rb'

class SlackPosterTest < Test::Unit::TestCase
  def test_post_message
    message = 'Hello, world!'
    channel_id = 'CHANNEL_ID'
    slack_token = 'SOME_TOKEN'
    params = { token: slack_token }

    network_request = MockedNetworkRequest.new
    slack_poster = SlackPoster.new(network_request)

    slack_poster.post_message(channel_id, message, slack_token)

    expected_uri = URI.parse('https://slack.com/api/chat.postMessage')
    expected_uri.query = URI.encode_www_form(params)
    assert_equal(expected_uri, network_request.instance_variable_get('@uri'))

    expected_payload = { 'channel' => channel_id, 'text' => message }
    assert_equal(expected_payload, network_request.instance_variable_get('@payload'))
  end

  def test_escape_newline
    message = 'Some text %0A with %0A new line'

    network_request = MockedNetworkRequest.new
    slack_poster = SlackPoster.new(network_request)

    message_result = slack_poster.escape_newline(message)

    expected_message = "Some text \n with \n new line"
    assert_equal(expected_message, message_result)
  end
end
