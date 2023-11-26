require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "show" do
        it "blocks unauthenticated access" do
            sign_in nil
            get :show
            expect(response).to redirect_to(new_user_session_path)
        end
  
        it "allows authenticated access" do
            sign_in
            get :show
            expect(response).to have_http_status(:success)
        end
    end
end