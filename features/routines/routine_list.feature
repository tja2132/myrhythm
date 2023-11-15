Feature: display list of routines

  As a stressed student
  So that I can focus on my studies and get to class on time
  I want to manage my schedule more effectively

  Background: routines have been added to database

    Given the following routines exist:
      | title                         | description                           | mon  | wed  | start_time |
      | Evening Workout               | A quick evening workout               | true | true | 06:58:50   |
      | Skincare Routine              | A simple skincare regiment            | true | false | 18:00:00   |
      | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false| 22:00:00   |

    And I am on the MyRhythm home page
    Then I should see all the routines

  Scenario: Add a new routine
    Given I am on the MyRhythm home page
    When I follow "New Routine"
    And I fill in "Title" with "Morning Workout"
    And I fill in "Description" with "my morning workout"
    And I press "Create Routine"
    Then I should see "Morning Workout"

  Scenario: View what days of the week routines occur
    Given I am on the MyRhythm home page
    Then I should see "Mon" 2 times
    And I should see "Wed" 1 time

  Scenario: View the recurrence of a routine
    Given I am on the MyRhythm home page
    Then I should see "None" 1 time

  Scenario: modify routine in database
    Given I am on the MyRhythm home page
    When I follow the "edit" button for the routine "Evening Workout"
    And I fill in "Title" with "Morning Workout"
    And I press "Update Routine"
    Then I should see "Routine was successfully updated."

  Scenario: modify routine on the routine page
    Given I am on the MyRhythm home page
    When I follow "The Perfect Grilled Cheese"
    When I follow the "edit" button for the routine "The Perfect Grilled Cheese"
    And I fill in "Title" with "The Best Grilled Cheese"
    And I press "Update Routine"
    Then I should see "Routine was successfully updated."

    # TODO
  Scenario: delete routine in database
    Given I am on the MyRhythm home page
    When I follow the "delete" button for the routine "Evening Workout"
#    And I follow "OK"
    Then I should not see "Evening Workout"

  Scenario: delete routine from the routine page
    Given I am on the MyRhythm home page
    When I follow "Skincare Routine"
    When I follow the "delete" button for the routine "Skincare Routine"
#    And I follow "OK"
    Then I should not see "Skincare Routine"
