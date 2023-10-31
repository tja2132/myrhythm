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

    And  I am on the MyRhythm home page
    Then 3 seed routines should exist
    And I should see all the routines

  Scenario: add routine to database
    And I add a routine ""
    Then 4 seed routines should exist

  Scenario: modify routine in database
    And I modify the "title" of a routine
    Then 4 seed routines should exist
    And I should see all the routines

  Scenario: delete routine in database
    And I delete a routine
    Then 2 seed routines should exist
    And I should see all the routines