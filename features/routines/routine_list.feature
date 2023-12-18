Feature: Display and Modify Routines on the Routine List

  As a stressed student
  So that I can focus on my studies and get to class on time
  I want to manage my schedule more effectively

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
    | title                         | description                           | mon  | wed  | start_time |
    | Evening Workout               | A quick evening workout               | true | true | 06:58:50   |
    | Skincare Routine              | A simple skincare regiment            | true | false | 18:00:00   |
    | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false| 22:00:00   |

    And I am on the routines page
    Then I should see all the routines for the email "guest@columbia.edu"

  Scenario: Add a new routine
    When I follow "New Routine"
    And I fill in "Title" with "Morning Workout"
    And I fill in "Description" with "my morning workout"
    And I press "Create Routine"
    Then I should see "Morning Workout"

  Scenario: View what days of the week routines occur
    Then I should see "Mon" 2 times
    And I should see "Wed" 1 time

  Scenario: modify routine in database
    When I follow the "edit" button for the routine "Evening Workout"
    And I fill in "Title" with "Morning Workout"
    And I press "Update Routine"
    Then I should see "Routine was successfully updated."

  Scenario: modify routine on the routine page
    When I follow the "edit" button for the routine "The Perfect Grilled Cheese"
    And I fill in "Title" with "The Best Grilled Cheese"
    And I press "Update Routine"
    Then I should see "Routine was successfully updated."

  Scenario: complete a routine on the routine page
    When I follow the "complete" button for the routine "The Perfect Grilled Cheese"
    Then I should see "The Perfect Grilled Cheese was successfully completed."
