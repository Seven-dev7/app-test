require 'rails_helper'

RSpec.describe "Embassies", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/embassy/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/embassy/new"
      expect(response).to have_http_status(:success)
    end
  end

end
