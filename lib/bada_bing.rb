require "typhoeus"
require "yajl"
require "pp"

require_relative "bada_bing/service"
require_relative "bada_bing/version"

module BadaBing
  class << self
    attr_accessor :application_id
    
    def web_search(query)
      Service::Web.new(query)
    end
  end
end
