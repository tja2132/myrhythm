Feature: display the MyRhythm home page

  As a potential MyRhythm user
  So that I can learn more about the site features
  I want to see the home page

  Scenario: navigate to the home page
    When I am on the home page
    Then I should see "MyRhythm"
    And I should see "Sync to the Beat of Your life"
    And I should see "Plan your day efficiently"
    And I should see "Track your progress, keep consistent"
    And I should see "Join the MyRhythm Community"

  Scenario: signup from the home page
    When I am on the home page
    And I go to the signup page
    And I fill in "user_email" with "email@columbia.edu"
    And I fill in "user_password" with "1234qwer"
    And I fill in "user_password_confirmation" with "1234qwer"
    And I fill in "user_first_name" with "UserName"
    And I fill in "user_last_name" with "Last"
    And I fill in "user_columbia_uni" with "bbbb2345"
    And I press "Sign up"
    Then I should see "Welcome! You have signed up successfully."
    When I go to the home page
    Then I should see "MyRhythm"
    And I should see "Sync to the Beat of Your life"
    And I should see "Plan your day efficiently"
    And I should see "Track your progress, keep consistent"
    And I should not see "Join the MyRhythm Community"
