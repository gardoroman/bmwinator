$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "bmwinator"
require 'pry'
require 'vcr'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)


VCR.configure do |c|
  c.cassette_library_dir = "vcr_cassettes"
  c.hook_into :webmock
end
