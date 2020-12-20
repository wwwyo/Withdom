require 'rails_helper'

RSpec.describe "Shares", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/shares/index"
      expect(response).to have_http_status(:success)
    end
  end

end
