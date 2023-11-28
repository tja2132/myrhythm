require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  fixtures :users
  login_user
  fixtures :routines

  describe "show" do
    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end

    it "lists all routines in calendar view" do
      get :show
      expect(assigns(:routines)).to eq(subject.current_user.routines.all)
    end
  end

  describe "day" do
    xit "lists all routines for a given day" do
      get :day
      expect(Routine.get_days_of_week.include?(@day))
    end
  end

  describe "get routines by day" do
    xit "returns routines mapped by day" do
    expect(CalendarsController.get_routines_by_day.keys).to eq(Routine.get_days_of_week)
    end
  end

end