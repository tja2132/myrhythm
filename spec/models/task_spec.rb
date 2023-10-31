require 'rails_helper'

RSpec.describe Task, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"
 fixtures :tasks
 it "includes tasks with titles" do
   expect(Task.all.size()).to eq 14
 end
end
