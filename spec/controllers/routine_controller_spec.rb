require 'rails_helper'

RSpec.describe RoutinesController, type: :controller do
  fixtures :users
  login_user
  fixtures :routines

  describe "index" do
    it "lists all routines" do
      get :index
      expect(assigns(:routines)).to eq(subject.current_user.routines.all)
      expect(subject.current_user.routines.all.count).to eq(3)
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
      @routine = subject.current_user.routines.create!(:title => "Skincare Routine", :description => "Keep your skin looking fabulous",
        :mon => true, :tue => true, :wed => true, :thu => true, :fri => true, :sat => true, :sun => true)
      expect(@routine).to be_an_instance_of Routine
    end

    after(:each) do
      Routine.find_by(:title => "Skincare Routine").destroy
    end

    it "shows new routine with valid parameters" do
      routine = Routine.find_by(title: "Skincare Routine")
      expect(routine.valid?).to be(true)
    end

    it "new routine with valid parameters via form submission" do
      get :create, params: {:title => "Leave telescope outside", 
                            :routine => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"
                            }}
      routine = Routine.find_by(:title => "Leave telescope outside")
      expect(flash[:notice]).to eq("Routine was successfully created.")
    end

    it "rejects routine with invalid parameters" do
      expect{get :create, params: {:title => nil, :task => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}}.to raise_error(ActionController::ParameterMissing)
    end
  end

  describe "saves" do
    after(:each) do
      Routine.find_by(:title => "Testing Routine").destroy
    end

    it "valid routine to the database" do
      starting_db_count = subject.current_user.routines.count
      routine = subject.current_user.routines.create!(:title => "Testing Routine", :mon => true, :wed => true, :fri => true)
      expect(subject.current_user.routines.count).to eq (starting_db_count + 1)
    end
  end

  describe "delete" do
    it "deletes routine" do
      @routine = subject.current_user.routines.create!(:title => "Testing Destroy", :mon => true, :wed => true, :fri => true)
      get :destroy, params: {:id=>@routine.id}
      expect{Routine.find(@routine.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe "update" do
    before(:each) do
      @routine = subject.current_user.routines.create!(:title => "Testing Routine", :mon => true, :wed => true, :fri => true)
    end

    after(:each) do
      Routine.find_by(:title => "Testing Routine").destroy
    end

    it "updates routine" do
      routine = Routine.find_by(title: "Testing Routine")
      post :update, params: {:id => routine.id, :routine => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}
      expect(flash[:notice]).to eq("Routine was successfully updated.")
    end
  end

  describe "sort" do
    it "sorts by title" do
      get :index, params: {:sortBy => "title"}
      expect(response).to be_successful
    end

    it "sorts by start time" do
      get :index, params: {:sortBy => "start_time"}
      expect(response).to be_successful
    end

    it "sorts by recurrence" do
      get :index, params: {:sortBy => "recurrence"}
      expect(response).to be_successful
    end

    it "sorts by end time" do
      get :index, params: {:sortBy => "end_time"}
      expect(response).to be_successful
    end
  end

end