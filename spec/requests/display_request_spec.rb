require 'rails_helper'

RSpec.describe "Displays", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/display/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/display/show"
      expect(response).to have_http_status(:success)
    end
  end

end
