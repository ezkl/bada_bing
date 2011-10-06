require 'spec_helper'

describe BadaBing do
  before(:all) do
    BadaBing.application_id = "400B3E08453374F9186FD32D2699A313071D0233"
  end
  
  it "should take an application ID" do
    BadaBing.application_id.should eq "400B3E08453374F9186FD32D2699A313071D0233"
  end
  
  describe "#web_search" do
    use_vcr_cassette
    
    before(:all) do            
      @request = BadaBing.web_search("test query")
    end
    
    it "should take a query string" do
      @request.query.should eq URI.encode "test query"
    end
    
    it "should use max_offset to determine true offset" do
      expect { @request.request_max_offset }.to change(@request, :max_offset).from(950).to(300)
    end
  end
end