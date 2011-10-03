$:.unshift(File.expand_path(File.dirname(__FILE__)))

require "faraday"

require "bada_bing/version"

module BadaBing
  class << self
    attr_accessor :application_id
  end
end
