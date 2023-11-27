require 'rails_helper'

RSpec.describe Task, type: :model do
  fixtures :tasks

  describe "all tasks" do
    it "includes all tasks with titles" do
      expect(Task.all.size()).to eq 14
    end
  end
end
