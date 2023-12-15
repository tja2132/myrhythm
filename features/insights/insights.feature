Feature: View Display a user's routine completion insights page

  As a MyRhythm user
  So that I can improve my productivity
  I want to see how many routines I have completed
  and insights about my completion history

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
      | title                         | description                           | mon  | wed  | thu  | sat  | sun  | start_time |
      | Evening Workout               | A quick evening workout               | true | true | true | true | true | 18:00:00   |
      | Skincare Routine              | A simple skincare regiment            | true | false| false| false| false| 08:00:00   |
      | Weekend Routine               | A great way to start the weekend      | false| false| false| true | true | 12:00:00   |

    And I am on the routines page

  Scenario: navigate to the insights page
    When I follow "Insights"
    Then I should be on the insights page
    And I should see "My Stats: All Time"

  Scenario: complete a routine and see your stats update
    When I follow "Insights"
    Then I should be on the insights page
    And I should see "My Stats: All Time"
    And I should see "You have not completed any routines Yet"
    When I go to the routines page
    And I follow the "complete" button for the routine "Evening Workout"
    Then I should see "Evening Workout was successfully completed."
    And I follow the "complete" button for the routine "Skincare Routine"
    Then I should see "Skincare Routine was successfully completed."
    And I follow the "complete" button for the routine "Weekend Routine"
    Then I should see "Weekend Routine was successfully completed."
    When I follow "Insights"
    Then I should be on the insights page
    And I should see "My Stats: All Time"
    And I should see "Total Routines Completed: 3"

  Scenario: see your most completed routine
    When I go to the routines page
    And I follow the "complete" button for the routine "Evening Workout"
    And I follow the "complete" button for the routine "Evening Workout"
    And I go to the insights page
    Then I should see "Total Routines Completed: 2"
    And I should see "Most Completed Routine: Evening Workout with 2 completions"
    When I go to the routines page
    And I follow the "complete" button for the routine "Skincare Routine"
    And I follow the "complete" button for the routine "Skincare Routine"
    And I follow the "complete" button for the routine "Skincare Routine"
    And I go to the insights page
    Then I should see "Total Routines Completed: 5"
    And I should see "Most Completed Routine: Skincare Routine with 3 completions"




    