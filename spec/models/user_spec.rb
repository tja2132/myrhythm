require 'rails_helper'

RSpec.describe User, type: :model do
  fixtures :users

  describe "all users" do
     it "includes all users" do
       expect(User.all.size()).to eq 1
     end
   end
end
