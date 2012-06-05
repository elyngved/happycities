class ComparisonsController < ApplicationController
  def home
  end

  def compare
    begin
      @city1 = City.new(params[:cities][:c1])
      @city2 = City.new(params[:cities][:c2])
    rescue Exception => e
      flash[:notice] = e.message
      render :home
    end
  end
end