class Tweet < Twitter::Status
  def sentiment
    @sentiment ||= Sentiment.score(self.text)
  end
end