require 'spec_helper'

describe City do
  let (:city) { City.new("Miami, FL") }

  it "should be initialized with a city name" do
    city.geo.should be
    city.geo.longitude.should be_a Float
    city.geo.latitude.should be_a Float
    city.geo.address.should be_a String
    city.geo.city.should be_a String
  end

  it "should raise an error when passed a non-recognizable location" do
    lambda { City.new("Ihopethisisnotactuallyarealplace") }.should raise_error
  end

  xit "should load tweets based on location" do
    TweetSearch.stub!(:by_geo).and_return("success!")
    city.tweets.should == "success!"
  end

  it "should get the overall sentiment of loaded tweets"
end