class CountryController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    foreigner_data = @country.foreigners
    @foreigner_year = foreigner_data.map{ |f| f.year}
    @embassies = @country.embassies
  end
end
