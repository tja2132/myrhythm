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

  Scenario: modify routine in database
    Given I am on the MyRhythm home page
    When I follow "edit" button for the "1" routine
    And I fill in "Title" with "Morning Workout"
    And I press "Update Routine"
    Then I should see "Routine was successfully updated."

  Scenario: Sort routines by name
    Given I am on the MyRhythm home page
    And I follow "Name"
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Evening Workout" before "The Perfect Grilled Cheese"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"

  Scenario: Sort routines by start time
    Given I am on the MyRhythm home page
    And I follow "Start Time"
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Evening Workout" before "The Perfect Grilled Cheese"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"

  Scenario: Sort routines by end time
    Given I am on the MyRhythm home page
    And I follow "End Time"
    #Then I should be on the MyRhythm home page sorted by "end_time"
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Evening Workout" before "The Perfect Grilled Cheese"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"

  Scenario: Sort routines by recurrence
    Given I am on the MyRhythm home page
    And I follow "Recurrence"
    #Then I should be on the MyRhythm home page sorted by "recurrence"
    Then I should see "The Perfect Grilled Cheese" before "Skincare Routine"
    And I should see "The Perfect Grilled Cheese" before "Evening Workout"
    And I should see "Evening Workout" before "Skincare Routine"
#
  # TODO
#  Scenario: delete routine in database
#    When I follow "Delete"
#    And I follow "OK"
#    Then I should not see "Evening Workout, Skincare Routine"
