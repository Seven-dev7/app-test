class CountryController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(params[:id])
    @foreigner_data = @country.foreigners
    @embassies = @country.embassies
  end
end
