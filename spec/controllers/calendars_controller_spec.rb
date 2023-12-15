require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  fixtures :users
  login_user
  fixtures :routines

  describe "calendar" do
    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end
  end
describe 'get new' do
    it "display blank new routine form" do
      get :daily
      expect(response).to be_successful()
      expect(response).to render_template(:daily)
    end
  end

describe 'get new' do
    it "display blank new routine form" do
      get :weekly
      expect(response).to be_successful()
      expect(response).to render_template(:weekly)
    end
  end

end