Feature: display all relevant information about a single routine and ensure it updates appropriately

  As a stressed student
  So that I can focus on my studies
  I want to update and view my routines effectively

  Background: routines have been added to database

    Given the following routines exist:
      | title                       | description                        | mon  | tue | wed | thu | fri | sat | sun  | start_time |
      | Study Routine               | A nightly study plan               | true | true| true| true| true| true| false| 12:00:00   |

    And I am on the MyRhythm home page
    Then I should see "Study Routine"

  Scenario: View the Routine
    Given I am on the MyRhythm home page
    When I follow "Study Routine"
    Then I should see "Study Routine"
    And I should see "Recurrence: Mon, Tue, Wed, Thu, Fri, Sat"
    And I should see "Total Duration: 0 min"
    And I should see "Start Time: 12:00pm"
    And I should see "End Time: 12:00pm"

  Scenario: adding a task to a routine with a non-zero duration increases the routine end time
    Given I am on the MyRhythm home page
    When I follow "Study Routine"
    And I should see "Total Duration: 0 min"
    And I should see "Start Time: 12:00pm"
    And I should see "End Time: 12:00pm"
    When I follow "Add Task"
    And I fill in "Task Name" with "Algebra"
    And I select "20" from "Minutes to complete task"
    And I press "Create Task"
    And I follow "Back to Routine"
    Then I should see "Total Duration: 20 minutes"
    And I should see "Start Time: 12:00pm"
    And I should see "End Time: 12:20pm"