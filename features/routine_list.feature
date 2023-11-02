Feature: display list of routines

  As a stressed student
  So that I can focus on my studies and get to class on time
  I want to manage my schedule more effectively

  Background: routines have been added to database

    Given the following routines exist:
      | title                         | description                           | recurrence | daysofweek       | start_time                   |
      | Evening Workout               | A quick evening workout               | Weekly     | M,W,F            | Time.local(2023, 1, 1, 6, 0) |
      | Skincare Routine              | A simple skincare regiment            | Daily      | M,T,W,Th,F,Sa,Su | Time.local(2023, 1, 1, 6, 0) |
      | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | None       |                  |                              |

    And I am on the MyRhythm home page
    Then I should see all the routines

  Scenario: Add a new routine
    Given I am on the MyRhythm home page
    When I follow "New Routine"
    And I fill in "Title" with "Morning Workout"
    And I fill in "Description" with "my morning workout"
    And I press "Create Routine"
    Then I should see "Morning Workout"

  # TODO
#  Scenario: modify routine in database
#    Given I am on the MyRhythm home page
#    When I follow "edit" button for the "1" routine
#    And I fill in "Title" with "Morning Workout"
#    And I follow "Update Routine"
#    Then I should see "Routine was successfully updated."
#
  # TODO
#  Scenario: delete routine in database
#    When I follow "Delete"
#    And I follow "OK"
#    Then I should not see "Evening Workout, Skincare Routine"
