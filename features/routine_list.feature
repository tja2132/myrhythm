Feature: display list of routines

  As a stressed student
  So that I can focus on my studies and get to class on time
  I want to manage my schedule more effectively

  Background: routines have been added to database

    Given the following routines exist:
      | title                         | description                           | mon  | wed  | start_time |
      | Evening Workout               | A quick evening workout               | true | true | 06:58:50   |
      | Skincare Routine              | A simple skincare regiment            | true | true | 18:00:00   |
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

  Scenario: View routines for the week
    Given I am on the MyRhythm home page
    Then I should see "Skincare Routine" 7 times
    And I should see "Evening Workout" 3 times
    And I should not see "The Perfect Grilled Cheese"

  Scenario: modify routine in database
     Given I am on the MyRhythm home page
    When I follow "edit" button for the "1" routine
    And I fill in "Title" with "Morning Workout"
    And I press "Update Routine"
    Then I should see "Routine was successfully updated."
#
  # TODO
#  Scenario: delete routine in database
#    When I follow "Delete"
#    And I follow "OK"
#    Then I should not see "Evening Workout, Skincare Routine"
