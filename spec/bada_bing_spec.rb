require 'spec_helper'

describe BadaBing do
  before(:all) do
    BadaBing.application_id = "400B3E08453374F9186FD32D2699A313071D0233"
  end
  
  it "should take an application ID" do
    BadaBing.application_id.should eq "400B3E08453374F9186FD32D2699A313071D0233"
  end
  
  describe "#web_search" do
    context "with results" do    
      before(:all) do
        VCR.use_cassette('with_results', :record => :new_episodes) do     
          @request = BadaBing.web_search("test query")
        end
      end
    
      it "should take a query string" do
        @request.query.should eq URI.encode "test query"
      end
    
      it "should use max_offset to determine true offset" do
        @request.max_offset.should be 400
      end
    end
    
    context "without results" do
      before(:all) do
        VCR.use_cassette('without_results', :record => :new_episodes) do  
          @request = BadaBing.web_search("zibblezabblezee")
        end
      end
      
      it "should return empty array if no results" do
        @request.results.should eq []
      end
    end
  end
end