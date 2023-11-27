require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users
  fixtures :routines

  describe "all users" do
     it "includes all users" do
       expect(User.all.size()).to eq 1
     end
   end

  describe "get user routines by day" do
    it "returns all routines for a user on a specific day" do
      current_user = users(:guest_user)
      expect(current_user.get_user_routines_by_day("Mon").count).to eq 2
      expect(current_user.get_user_routines_by_day("Sun").count).to eq 1
    end
  end
end