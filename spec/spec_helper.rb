require 'bada_bing'
require 'vcr'
require 'rspec'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into :typhoeus
  c.configure_rspec_metadata!
end

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.extend VCR::RSpec::Macros
end

include BadaBing