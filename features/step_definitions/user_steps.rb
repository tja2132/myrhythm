Given /^the following user exists and is logged in:$/ do |user_table|
    user_table.hashes.each do | user |
        user = User.create(user)
        expect(user).to be_an_instance_of User

        visit new_user_session_path
        step %{I fill in "Email" with "#{user.email}"}
        step %{I fill in "Password" with "#{user.password}"}
        #fill_in "user[#{Email}]", :with => "#{user.name}"
        #fill_in "user[#{Password}]", :with => "#{user.value}"
        step %{I press "Sign in"}
    end

    # table is a Cucumber::MultilineArgument::DataTable
    #pending # Write code here that turns the phrase above into concrete actions
end

Given /^the following users exist:$/ do |user_table|
    user_table.hashes.each do | user |
        User.create(user)
    end
    # table is a Cucumber::MultilineArgument::DataTable
    #pending # Write code here that turns the phrase above into concrete actions
end

Given /^the following users do not exist:$/ do |user_table|
    user_table.hashes.each do | email, value |
        user = User.find_by_email("#{value}")
        expect(user).not_to be_an_instance_of User
    end
end