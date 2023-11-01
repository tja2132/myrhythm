require 'rails_helper'

RSpec.describe Task, type: :model do

 fixtures :tasks

 describe "all tasks" do
    it "includes all tasks with titles" do
      expect(Task.all.size()).to eq 14
    end
  end

  describe "with_same_routine method" do
    it "returns all tasks within the same routine" do
      routine = Routine.find_by_title("Watch meteor shower")
      tasks = Task.with_same_routine(routine)
      expect(tasks.size).to eq 4
    end

    it "returns no tasks within new routine" do
      routine = nil
      tasks = Task.with_same_routine(routine)
      expect(tasks.size).to eq 0
    end
  end

 
end
