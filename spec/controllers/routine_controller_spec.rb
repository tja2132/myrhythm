require 'rails_helper'

RSpec.describe RoutinesController, type: :controller do
  fixtures :routines

  describe "index" do
    it "lists all routines" do
      get :index
      expect(assigns(:routines)).to eq(Routine.all)
    end
  end

  describe 'GET #new' do
    it "routine form" do
        get :new
        expect(response).to be_successful()
        expect(response).to render_template(:new)
    end
  end

  describe "creates" do
    it "routine with valid parameters" do
      put :create, {:routine => {:title => "Skincare Routine", :description => "Keep your skin looking fabulous",
                    :recurrence => "daily", :daysofweek => "M,T,W,Th,F,Sa,Su"}}
      expect(response).to redirect_to routines_path
      expect(flash[:notice]).to match('Skincare Routine was successfully created.')
      Routine.find_by(:title => "Skincare Routine").destroy
    end
  end
end