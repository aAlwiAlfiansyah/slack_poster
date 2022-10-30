#!/usr/bin/env ruby

# frozen_string_literal: true

require 'simplecov/no_defaults'
require 'simplecov-html'
require 'simplecov/profiles/root_filter'
require 'test/unit'
require 'mocha/test_unit'

SimpleCov.start do
  formatter SimpleCov::Formatter::HTMLFormatter
  load_profile 'root_filter'
  add_filter %r{^/test/}
end

SimpleCov.command_name
# SimpleCov::CommandGuesser.original_run_command = "#{$PROGRAM_NAME} #{ARGV.join(' ')}"

at_exit do
  # If we are in a different process than called start, don't interfere.
  return if SimpleCov.pid != Process.pid

  SimpleCov.run_exit_tasks!
end

## Workaround for flagging test
ENV['IS_TEST'] = true.to_s
