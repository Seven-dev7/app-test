class CountryController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @foreigner_data = @country.foreigners
    @embassies = @country.embassies
    @hash = Gmaps4rails.build_markers(@embassies) do |embassy, marker|
      marker.lat embassy.latitude
      marker.lng embassy.longitude
    end
  end
end
