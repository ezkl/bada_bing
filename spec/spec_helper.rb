require 'bada_bing'
require 'vcr'
require 'webmock/rspec'

VCR.config do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.stub_with                :typhoeus
  c.default_cassette_options = { :record => :new_episodes }
end

RSpec.configure do |config|
  config.extend VCR::RSpec::Macros
  config.mock_framework = :rspec
end

include BadaBing