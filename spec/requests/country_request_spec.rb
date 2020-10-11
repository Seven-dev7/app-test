require 'rails_helper'

RSpec.describe "Countries", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/country/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/country/show"
      expect(response).to have_http_status(:success)
    end
  end

end
