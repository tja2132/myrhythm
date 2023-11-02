require 'rails_helper'

RSpec.describe RoutinesController, type: :controller do
  fixtures :routines

  describe "index" do
    it "lists all routines" do
      get :index
      expect(assigns(:routines)).to eq(Routine.all)
    end
  end

    describe 'get new' do
        it "display blank new routine form" do
            get :new
            expect(response).to be_successful()
            expect(response).to render_template(:new)
        end
    end

    describe "creates" do
        before(:each) do
            @routine = Routine.create(:title => "Skincare Routine", :description => "Keep your skin looking fabulous",
            :recurrence => "daily", :daysofweek => "M,T,W,Th,F,Sa,Su")
            expect(@routine).to be_an_instance_of Routine
        end

        after(:each) do
            Routine.find_by(:title => "Skincare Routine").destroy
        end

        it "shows new routine with valid parameters" do
          @routine = Routine.find_by(title: "Skincare Routine")
          expect(@routine.valid?).to be(true)
        end

        it "new routine with valid parameters via form submission" do
          get :create, params: {:title => "Leave telescope outside", :routine => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}
          @routine = Routine.find_by(:title => "Leave telescope outside")
          expect(flash[:notice]).to eq("Routine was successfully created.")
          expect(response).to redirect_to(routine_path(:id => 5))
        end

        it "rejects routine with invalid parameters" do
          expect{get :create, params: {:name => "Leave telescope outside", :task => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}}.to raise_error(ActionController::ParameterMissing)
        end
    end

    describe "saves" do
        it "valid routine to the database" do
            starting_db_count = Routine.count
            @routine = Routine.create(:title => "Testing Routine", :recurrence => "daily", :daysofweek => "M,W,F")
            expect(Routine.count).to eq (starting_db_count + 1)
        end
    end

    describe "update" do
        before(:each) do
            @routine = Routine.create(:title => "Testing Routine", :recurrence => "daily", :daysofweek => "M,W,F")
        end
        it "updates routine" do
          post :update, params: {:id => @routine.id, :routine => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}
          expect(flash[:notice]).to eq("Routine was successfully updated.")
        end
        after(:each) do
            Routine.find_by(:title => "Testing Routine").destroy
        end

#        xit "allows routine to be edited with valid parameters" do
#            put :update, :id => @routine.id, :routine => { :title => 'NEW Routine!', :daysofweek => 'M' }

#            expect(response).to redirect_to(routine_url(@routine))
#            expect(@routine.title).to eql attr[:title]
#            expect(@routine.daysofweek).to eql attr[:daysofweek]
#        end
    end

  describe "delete" do
    it "deletes routine" do
      @routine = Routine.create(:title => "Testing Destroy", :recurrence => "daily", :daysofweek => "M,W,F")
      get :destroy, params: {:id=>@routine.id}
      expect{Routine.find(@routine.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

end