require 'spec_helper'

describe BadaBing do
  it "should take an application ID" do
    BadaBing.application_id = "1234567"
    BadaBing.application_id.should eq "1234567"
  end
end