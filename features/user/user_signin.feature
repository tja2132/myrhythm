Feature: Sign in to MyRhythm

  As a MyRhythm user
  So that I can keep track of my routines
  I want to sign-in and view my routines

Background: User has already registered with MyRhythm

  Given the following users exist:
  | first_name | last_name | columbia_uni | email              | password | 
  | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

Scenario: Log in to the system
  When I go to the login page
  And I fill in "user_email" with "guest@columbia.edu" 
  And I fill in "user_password" with "1234qwer"
  And I press "Sign in"
  Then I should see "Signed in successfully."

