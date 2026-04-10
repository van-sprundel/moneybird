# frozen_string_literal: true

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start
end

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'minitest/autorun'
require 'webmock/minitest'
WebMock.disable_net_connect!

require 'moneybird'

def fixture_response(file, directory = 'responses')
  File.read("spec/fixtures/#{directory}/#{file}.json")
end

def hash_response(file, directory = 'responses')
  JSON.parse(fixture_response(file, directory))
end
