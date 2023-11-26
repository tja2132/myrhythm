require 'rails_helper'

RSpec.describe "Homes", type: :request do

  describe "GET /", focus: true do
    it "redirects to home page" do
      get "/"
      expect(response).to have_http_status(:redirect)
      expect(response).to redirect_to("/home")
    end
  end

end