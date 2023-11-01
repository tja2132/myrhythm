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
        before do
            @routine = Routine.create(:title => "Skincare Routine", :description => "Keep your skin looking fabulous",
            :recurrence => "daily", :daysofweek => "M,T,W,Th,F,Sa,Su")
            expect(@routine).to be_an_instance_of Routine
        end

        xit "shows new routine with valid parameters" do

        end

        xit "new routine with valid parameters via form submission" do
            #put :create, @routine
            #expect(response).to redirect_to routine_tasks_path(@routine)
            #expect(flash[:notice]).to match('Clean up was successfully created.')
        end

        xit "rejects routine with invalid parameters" do
            
        end

        after do
            Routine.find_by(:title => "Skincare Routine").destroy
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
        before do
            @routine = Routine.create(:title => "Testing Routine", :recurrence => "daily", :daysofweek => "M,W,F")
        end

#        xit "allows routine to be edited with valid parameters" do
#            put :update, :id => @routine.id, :routine => { :title => 'NEW Routine!', :daysofweek => 'M' }

#            expect(response).to redirect_to(routine_url(@routine))
#            expect(@routine.title).to eql attr[:title]
#            expect(@routine.daysofweek).to eql attr[:daysofweek]
#        end

        after do
            Routine.find_by(:title => "Testing Routine").destroy
        end
    end
end