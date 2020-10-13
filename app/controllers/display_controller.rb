class DisplayController < ApplicationController
  def index
    @countries = Country.all
    @embassies = Embassy.all
  end

  def show
  end
end
