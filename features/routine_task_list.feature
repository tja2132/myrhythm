Feature: display list of tasks for a routine

  As a busy office worker
  So that I can get to work on time in the morning
  I want to manage my morning tasks

  Background: morning routine has been added to database

    Given the following tasks exist:
      | title              | description                                   | sequence | duration |
      | Make Coffee        | Start Kettle, Grind Coffee Beans, Brew Coffee | 1        | 15       |
      | Shower             | Shower                                        | 2        | 15       |
      | Put on Clothes     | Get Dresssed                                  | 3        | 15       |
      | Make Breakfast     | Grab egg bites from fridge and eat with toast | 4        | 5        |
      | Take Meds          | be healthy!                                   | 5        | 1        |
      | Brush teeth        |                                               | 6        | 3        |
      | Gather work things | Gather bookbag, laptop, badge, keys, phone, wallet | 7   | 10       |

    And I am on the page for my morning routine
    Then 7 seed tasks should exist
    And I should see all the tasks for my morning routine

  Scenario: add task on a routine
    When I click "Add New Task" on a routine
    And I fill-in the task fields
    And I click "Create Task"
    Then I should see the new task on my routine

  Scenario: modify task on a routine
    When I click "Edit" on a task
    And I modify the "title" of the task
    And I click "Update"
    Then I should see the new task title

  Scenario: delete task from a routine
    When I click "Delete on a task"
    And I click "Ok" on the pop-up
    Then I should see the task removed from the routine
