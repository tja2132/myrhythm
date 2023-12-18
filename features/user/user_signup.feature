Feature: Sign up for MyRhythm

  As a potential MyRhythm user
  So that I can do more routine management
  I want to sign-up for the MyRhythm site

Background: User does not exist in MyRhythm

  Given the following users do not exist:
  | email              | 
  | guest@columbia.edu |

Scenario: Register as a new user on MyRhythm 
  When I go to the signup page
  And I fill in "user_email" with "email@columbia.edu" 
  And I fill in "user_password" with "1234qwer"
  And I fill in "user_password_confirmation" with "1234qwer"
  And I fill in "user_first_name" with "UserName"
  And I fill in "user_last_name" with "Last"
  And I fill in "user_columbia_uni" with "bbbb2345"
  And I press "Sign up"
  Then I should see "Welcome! You have signed up successfully."