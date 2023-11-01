Feature: display list of routines

  As a stressed student
  So that I can complete my routines
  I want to see my routines

  Background: routines have been added to database

    Given the following routines exist:
      | title                         | description                           | recurrence | daysofweek       | start_date | end_date | start_time | end_time |
      | Evening Workout               | A quick evening workout               | Weekly     | M,W,F            | 2023-1-1   | 2024-1-1 | 6:00       | 6:35     |
      | Skincare Routine              | A simple skincare regiment            | Daily      | M,T,W,Th,F,Sa,Su | 2023-1-1   | 2024-1-1 | 7:00       | 7:35     |
      | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | None       |                  |            |          |            |          |

    And I am on the MyRhythm home page
    Then 3 seed routines should exist
    And I should see all the routines

  Scenario: Add a new routine
    When I click "Add New Routine"
    #...
    Then 4 seed routines should exist
    And I should see all the routines

  Scenario: modify routine in database
    When I modify the "title" of a routine titled: The Perfect Grilled Cheese
    And I click "Update"
    Then I should see the following routine titles: Evening Workout, Skincare Routine, The Perfect Melt

  Scenario: delete routine in database
    When I click the delete button for a routine
    And I press Okay on the pop-up
    Then I should see the following routines: Evening Workout, Skincare Routine