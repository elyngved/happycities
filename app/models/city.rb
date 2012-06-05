class City

  attr_accessor :geo
  delegate :city, :state, :country, :address, :longitude, :latitude, :to => :@geo

  def initialize(location_string, tweet_params={})
    @geo = Geocoder.search(location_string).first
    raise "Location #{location_string} not found" if @geo.nil?
    @tweet_params = tweet_params
  end

  def tweets
    @tweets ||= Twitter.search("", {:geocode => "#{geo.latitude},#{geo.longitude},50mi", :rpp => 100}.merge(@tweet_params)).map{|t| Tweet.new t}
  end

  def sentiment
    @sentiment ||= tweets.map(&:sentiment).inject(:+)
  end

  def happiest
    @happiest ||= tweets.max_by {|t| t.sentiment}
  end

end