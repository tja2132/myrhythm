require 'rails_helper'

RSpec.describe CalendarController, type: :controller do
  fixtures :routines

  describe "index" do
    it "lists all routines in calendar view" do
      get :index
      expect(assigns(:routines)).to eq(Routine.all)
    end
  end

end