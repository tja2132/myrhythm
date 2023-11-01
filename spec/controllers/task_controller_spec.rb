require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  fixtures :routines, :tasks

  describe "index" do
    before do
        @routine = Routine.find_by(:title => "Watch meteor shower")
    end

    it "routes to the task controller" do
        expect(get: "/routines/1/tasks").to route_to(controller: "tasks", action: "index", routine_id: "1")
    end

    xit "lists all tasks for a routine" do
        
    end
  end

    describe 'get new' do
        before do
            @routine = Routine.find_by(:title => "Watch meteor shower")
        end

        it "display blank new task form" do
            expect(get: "/routines/1/tasks/new").to route_to(controller: "tasks", action: "new", routine_id: "1")
        end
    end

    describe "creates" do
        it "task with valid parameters for an existing routine" do
            @task = Task.create(:title => "Clean up", :description =>"Clean up before going back inside")
            expect(@task).to be_an_instance_of Task
        end

        xit "new task via form submission" do
            #expect(response).to redirect_to routine_tasks_path(@routine)
            #expect(flash[:notice]).to match('Clean up was successfully created.')
        end
        xit "rejects task with invalid parameters" do

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
        xit "allows task to be edited with valid parameters" do
#            put :update, :id => 1, :task => { :title => 'NEW task!', :sequence => 2 }

        end
    end
end