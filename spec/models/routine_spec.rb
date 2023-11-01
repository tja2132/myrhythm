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
      it "returns all days of the week" do
        daysofweek = Routine.all_daysofweek
        expect(daysofweek).to eq ['M','T','W', 'Th', 'F', 'Sa', 'Su']
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
        end_time = Routine.calculate_end_time(Time.local(2023, 1, 1, 6, 0), duration)

        expect(end_time).to eq (Time.local(2023, 1, 1, 6, 0) + (60*165))
      end

      it "returns empty end time based on start time nil" do
        duration = nil
        end_time = Routine.calculate_end_time(Time.local(2023, 1, 1, 6, 0), duration)

        expect(end_time).to eq ('')
      end
    end
end