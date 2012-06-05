class City
  attr_accessor :geo
  delegate :city, :state, :country, :address, :longitude, :latitude, :to => :@geo

  def initialize(location_string)
    @geo = Geocoder.search(location_string).first
    raise "Location #{location_string} not found" if @geo.nil?
  end

  def tweets
    @tweets ||= Twitter.search("", :geocode => "#{geo.latitude},#{geo.longitude},50mi", :rpp => 100)
  end

  def sentiment

  end

end