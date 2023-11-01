# in spec/models/routine_spec.rb

require 'rails_helper'

RSpec.describe Routine, type: :model do

  #pending "add some examples to (or delete) #{__FILE__}"

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

end