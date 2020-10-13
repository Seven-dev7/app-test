class CountryController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @foreigner_data = @country.foreigners
    @foreigner_year = @foreigner_data.map{ |f| f.year}
    @foreigner_number = @foreigner_data.map{ |f| f.number_of_french}
    @embassies = @country.embassies
    @hash = Gmaps4rails.build_markers(@embassies) do |embassy, marker|
      marker.lat embassy.latitude
      marker.lng embassy.longitude
    end
  end
end
