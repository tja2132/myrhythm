require 'rails_helper'

RSpec.describe CalendarsController, type: :controller do
  fixtures :routines

  describe "show" do
    it "lists all routines in calendar view" do
      get :show
      expect(assigns(:routines)).to eq(Routine.all)
    end
  end

  describe "day" do
    it "lists all routines for a given day" do
      get :day
      expect(Routine.get_days_of_week.include?(@day))
    end
  end

  describe "get routines by day" do
    it "returns routines mapped by day" do
    expect(CalendarsController.get_routines_by_day.keys).to eq(Routine.get_days_of_week)
    end
  end

end