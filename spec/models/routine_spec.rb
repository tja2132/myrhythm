# in spec/models/routine_spec.rb

require 'rails_helper'

RSpec.describe Routine, type: :model do
  fixtures :users
  fixtures :routines
  
  describe "all routines" do
    it "includes all routines" do
      current_user = users(:guest_user)
      expect(current_user.routines.all.size()).to eq 3
    end
  end
  
  describe "all_daysofweek method" do
    it "returns all days of the week" do
        expect(Routine.get_full_days_of_week).to eq(['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'])
      end
    end

    describe "total_duration method" do
      it "returns total duration of all tasks for a routine" do
        routine = routines(:meteor_routine)
        duration = Routine.total_duration(routine)
        expect(duration).to eq 165
      end
    end

    describe "calculate end_time method" do
      it "returns end time based on start time and duration" do
        routine = Routine.find_by(:title => "Watch meteor shower")
        expect(routine.valid?).to be(true)

        end_time = Routine.end_time(routine)

        expect(end_time).to eq(Time.zone.parse('2000-01-01 6:0:0') + (60*165))
      end
    end

      describe "get recurrence string", focus: true do
        it "returns the recurrence string based on which days of week the routine occurs on" do
          routine = Routine.find_by(:title => "Get ready for work")
          expect(Routine.get_routine_recurrence(routine)).to eq "Daily"
        end

        it "returns the recurrence string based on which days of week the routine occurs on" do  
          routine = Routine.find_by(:title => "Make Dinner")
          expect(Routine.get_routine_recurrence(routine)).to eq "Weekly"
        end

        it "returns the recurrence string based on which days of week the routine occurs on" do
          routine = Routine.find_by(:title => "Watch meteor shower")
          expect(Routine.get_routine_recurrence(routine)).to eq "None"
        end
      end

      describe "get days of week", focus: true do
        it "returns the recurrence string based on which days of week the routine occurs on" do
          routine = Routine.find_by(:title => "Get ready for work")
          expect(Routine.get_routine_days_of_week_short_str(routine)).to eq "Mon, Tue, Wed, Thu, Fri, Sat, Sun"
        end
      

        it "returns empty end time based on start time nil" do
          routine = Routine.find_by(:title => "Get ready for work")
          duration = nil

          expect { end_time = routine.start_time + duration }.to raise_error(TypeError)
        end
      end
end