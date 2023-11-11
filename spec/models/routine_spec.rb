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
        expect(DAYS_OF_WEEK_ABBR).to eq ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
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

        duration = Routine.total_duration(routine)
        end_time = routine.start_time + duration

        expect(end_time).to eq (Time.local(2023, 1, 1, 6, 0) + (60*165))
      end

      it "returns empty end time based on start time nil" do
        routine = Routine.find_by(:title => "Get ready for work")
        duration = nil

        expect { end_time = routine.start_time + duration }.to raise_error(TypeError)
      end
    end
end