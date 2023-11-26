Given /^the following users exist:$/ do |user_table|
    user_table.hashes.each do | user |
        User.create(user)
    end
    # table is a Cucumber::MultilineArgument::DataTable
    #pending # Write code here that turns the phrase above into concrete actions
end

Given /^a valid user$/ do

    @user = User.create!({
                :email => "email@columbia.edu",
                :password => '1234qwer',
                :password_confirmation => '1234qwer',
                #:encrypted_password => "encrypted_password: $2a$12$zk8ZT1GXYPjADI//cU7QmeZskWeBfM3z6uvCPljYupXUgX9eOU4km",
                :first_name => "guest",
                :last_name => "user",
                :columbia_uni => "guest1204"
             })
end
 

When('I fill in the login following:') do |table|
    visit '/users/sign_in'
    page.should have_content "Login"
    #routines_table.hashes.each do |routine|
    #    Routine.create(routine)
    #  end
    #fields.rows_hash.each do |name, value|
    #    fill_in "user[#{name}]", :with => "#{value}"
    # table is a Cucumber::MultilineArgument::DataTable
    #pending # Write code here that turns the phrase above into concrete actions
    #end
end

#When /^(?:|I )fill in the login following:$/ do |fields|
#    When %{I fill in "user_email" with "guest@columbia.edu"}
    #page.should have_content user_password
    #fields.rows_hash.each do |name, value|
    #  When %{I fill in "#{name}" with "#{value}"}
    #end
#end