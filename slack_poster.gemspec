# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'slack_poster'
  s.version = '0.0.1'
  s.date = '2020-01-24'
  s.files = [
    'lib/slack_poster.rb',
    'lib/slack_poster/network_request.rb'
  ]
  s.executables << 'slack_poster'
  s.require_paths = ['lib']
  s.licenses    = ['MIT']
  s.summary     = 'Ruby script to send message to slack'
  s.description = <<-DESC
  slack_poster is simple ruby script to send message to slack
  DESC
  s.authors     = ['Alwi Alfiansyah']
  s.email       = ['alwi.alfiansyah@bukalapak.com']
  s.add_development_dependency 'cucumber', '~> 3.1', '>= 3.1.2'
  s.add_development_dependency 'mocha', '~> 1.11', '>= 1.11.2'
  s.add_development_dependency 'rake', '~> 13.0', '>= 13.0.1'
  s.add_development_dependency 'rubocop', '~> 0.79', '>= 0.79.0'
  s.add_development_dependency 'rufo', '~> 0.8', '>= 0.8.1'
  s.add_development_dependency 'simplecov', '~> 0.17', '>= 0.17.1'
  s.add_development_dependency 'simplecov-html', '~> 0.10', '>= 0.10.2'
  s.add_development_dependency 'test-unit', '~> 3.3', '>= 3.3.5'
  s.add_development_dependency 'webmock', '~> 3.7', '>= 3.7.6'
end
