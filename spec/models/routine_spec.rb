# in spec/models/routine_spec.rb

require 'rails_helper'

RSpec.describe Routine, type: :model do

  #pending "add some examples to (or delete) #{__FILE__}"

  fixtures :routines
    it "includes routines with titles" do
      expect(Routine.all.size()).to eq 3
    end
end