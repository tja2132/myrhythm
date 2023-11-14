# in spec/models/routine_spec.rb

require 'rails_helper'

RSpec.describe Routine, type: :model do

fixtures :routines
  describe "all routines" do
    it "includes all routines" do
      expect(Routine.all.size()).to eq 3
    end
  end
  
  describe "all_daysofweek method" do
    xit "returns all days of the week" do
        expect(Routine.get_days_of_week).to eq ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
      end
    end

    describe "total_duration method" do
      it "returns total duration of all tasks for a routine" do
        duration = Routine.total_duration(routines(:meteor_routine))
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

      it "returns default start time value for end_time if no start_time is specified" do
        routine = Routine.find_by(:title => "Get ready for work")
        expect(routine.valid?).to be(true)

        end_time = Routine.end_time(routine)

        expect(end_time).to eq(Time.zone.parse('2000-01-01 1:56:11'))
      end

      describe "get recurrence string" do
        it "returns the recurrence string based on which days of week the routine occurs on" do
          routine = Routine.find_by(:title => "Get ready for work")
          expect(Routine.get_recurrence_str(routine)).to eq "Daily"
          
          routine2 = Routine.find_by(:title => "Make Dinner")
          expect(Routine.get_recurrence_str(routine2)).to eq "Weekly"

          routine3 = Routine.find_by(:title => "Watch meteor shower")
          expect(Routine.get_recurrence_str(routine3)).to eq "None"
        end
      end

      describe "get days of week" do
        it "returns the recurrence string based on which days of week the routine occurs on" do
          routine = Routine.find_by(:title => "Get ready for work")
          expect(Routine.get_days_of_week_str(routine)).to eq "Mon, Tue, Wed, Thu, Fri, Sat, Sun"
        end
      end


      it "returns empty end time based on start time nil" do
        routine = Routine.find_by(:title => "Get ready for work")
        duration = nil

        expect { end_time = routine.start_time + duration }.to raise_error(TypeError)
      end
    end
end