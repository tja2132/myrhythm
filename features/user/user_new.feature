Feature: Sign up

Background: User is signed out of MyRhythm

    Given the following users exist:
        | first_name | last_name | columbia_uni | email              | password | 
        | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |


Scenario: Register new user with MyRhythm
  When I go to the signup page
  And I fill in "user_email" with "guest@columbia.edu" 
  And I fill in "user_password" with "1234qwer"
  And I press "Sign in"
  Then I should see "Signed in successfully."