class DisplayController < ApplicationController
  def index
    @countries = Country.all
  end

  def show
  end
end
