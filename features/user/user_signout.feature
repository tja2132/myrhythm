Feature: Update User's Profile in MyRhythm

  As a MyRhythm user
  So my identity remains secure
  I want to sign-out of MyRhythm

Background: User has already registered with MyRhythm

  Given the following user exists and is logged in:
  | first_name | last_name | columbia_uni | email              | password | 
  | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

Scenario: Logout of MyRhythm
  When I go to my profile page
  Then I click on "Logout"
  Then I should see "Signed out successfully."