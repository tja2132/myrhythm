require 'rails_helper'

RSpec.describe CalendarController, type: :controller do
  fixtures :users
  login_user
  fixtures :routines

  describe "index" do
    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end

    it "lists all routines in calendar view" do
      get :index
      expect(assigns(:routines)).to eq(subject.current_user.routines.all)
    end
  end

end