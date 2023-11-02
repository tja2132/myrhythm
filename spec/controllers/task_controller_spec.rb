require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  fixtures :routines, :tasks

  describe "index" do
    before(:each) do
        @routine = Routine.find_by(:title => "Watch meteor shower")
    end

    it "routes to the task controller" do
      #expect(get: "/routines/1/tasks").to route_to(controller: "tasks", action: "index", routine_id: "1")
      get :index, params: { routine_id: @routine.id, id: 1}
    end

    it "lists all tasks for a routine" do
      @routine = Routine.find_by(:title => "Watch meteor shower")
      @tasks = Task.where(:routine_id => @routine.id)
      expect(@tasks.count).to eq(4)
    end
  end

    describe 'get new' do
        before(:each) do
            @routine = Routine.find_by(:title => "Watch meteor shower")
        end

        it "display blank new task form" do
          #expect(get: "/routines/1/tasks/new").to route_to(controller: "tasks", action: "new", routine_id: "1")
          get :new, params: { routine_id: @routine.id}
        end
    end

    describe "creates" do
      before(:each) do
        @routine = Routine.find_by(:title => "Watch meteor shower")
      end
      it "task with valid parameters for an existing routine" do
          @task = Task.create(:title => "Clean up", :description =>"Clean up before going back inside")
          expect(@task).to be_an_instance_of Task
      end

      it "new task via form submission" do
        put :create, params: {:routine_id => @routine.id, :task => {:title => "Let telescope acclimate", :description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}
      end

      it "rejects task with invalid parameters" do
        expect{put :create, params: {:routine_id => @routine.id, :task => {:title => nil, :description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}}.to raise_error(ActionController::UnknownFormat)
      end
    end

    describe "saves" do
        it "valid task to the database" do
            starting_db_count = Task.count
            @task = Task.create(:title => "Testing Task", :routine_id => 1)
            expect(Task.count).to eq (starting_db_count + 1)
        end
    end

    describe "update" do
      it "allows task to be edited with valid parameters" do
        @routine = Routine.find_by(:title => "Watch meteor shower")
        put :update, params: {:id => Task.find_by(:title => "Setup telescope").id, :routine_id => @routine.id, :task => {:description =>  "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}
        expect(flash[:notice]).to eq("Task was successfully updated.")
        #put :update, params: {:id => Task.find_by(:title => "Setup telescope").id, :task => {:description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature"}}
        end
    end

  describe "deletes" do
    it "allows task to be deleted" do
      @routine = Routine.find_by(:title => "Watch meteor shower")
      @task = Task.create(:title => "Let telescope acclimate", :routine_id => 1, :description => "Leave telescope outside for 30 minutes to allow it to adjust to outside temperature")
      put :destroy, params: {:routine_id => @routine.id, :id => @task.id}
      expect{Task.find(@task.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end