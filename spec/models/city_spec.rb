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

  it "should load tweets based on location" do
    tweets = city.tweets
    tweets.should be_a Array
  end

  it "should get the overall sentiment of loaded tweets"
end