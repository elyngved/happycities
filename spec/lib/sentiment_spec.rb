require 'spec_helper'

describe Sentiment do
  it "should give text a sentiment score" do
    Sentiment.score("I hate your guts and I want to punch you").should < 0
    Sentiment.score("I love you and I want to make babies with you").should > 0
  end
end