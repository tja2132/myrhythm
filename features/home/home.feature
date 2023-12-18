Feature: Display the MyRhythm home page

As a potential MyRhythm user
So that I can learn more about the site features
I want to see the home page

Background: I am on the home Page
  
  Given I am on the home page

Scenario: navigate to the home page
  When I am on the home page
  Then I should see "MyRhythm"
  And I should see "Sync to the Beat of Your life"
  And I should see "Plan your day efficiently"
  And I should see "Track your progress, keep consistent"
  And I should see "Join the MyRhythm Community"

Scenario: signup from the home page
  When I am on the home page
  And I click on "Sign Up"
  Then I should be on the signup page
