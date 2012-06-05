class City
  attr_accessor :geo

  def initialize(location_string)
    @geo = Geocoder.search(location_string).first
    raise "Location #{location_string} not found" if @geo.nil?
  end

  def tweets
    @tweets ||= TweetSearch.by_geo @geo
  end


end