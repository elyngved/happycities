require 'spec_helper'

describe Tweet do
  let (:tweet) { Tweet.new(Twitter.search("awesome", :rpp => 1).first) }
  it "should be intialized by a twitter gem tweet" do
    tweet.should be_a Tweet
    tweet.text.should be_a String
  end

  it "should find and record its sentiment value" do
    tweet.sentiment.should be_a Float
  end
end