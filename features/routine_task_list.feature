Feature: display list of tasks for a routine

  As a busy office worker
  So that I can get to work on time in the morning
  I want to manage my morning tasks

  Background: morning routine has been added to database

    Given the following routines exist:
      | title                         | description                           | recurrence | daysofweek       | start_date | end_date | start_time | end_time |
      | Morning Routine               | my morning routine                    | Weekly     | M,W,F            | 2023-1-1   | 2024-1-1 | 6:00       | 6:35     |

    Given the following tasks exist:
      | title              | description                                   | sequence | duration |
      | Make Coffee        | Start Kettle, Grind Coffee Beans, Brew Coffee | 1        | 15       |
      | Shower             | Shower                                        | 2        | 15       |
      | Put on Clothes     | Get Dressed                                   | 3        | 15       |
      | Make Breakfast     | Grab egg bites from fridge and eat with toast | 4        | 5        |
      | Take Meds          | be healthy!                                   | 5        | 1        |
      | Brush teeth        |                                               | 6        | 3        |
      | Gather work things | Gather bookbag, laptop, badge, keys, phone, wallet | 7   | 10       |

    And I am on the routines page
    And I follow "Morning Routine"
#    And I should see all the tasks

  Scenario: add task on a routine
    When I follow "The Perfect Grilled Cheese"
    And I follow "Add Task"
    And I fill in "Title" with "Morning Workout"
    And I follow "Create Task"
    Then I should see "Task was successfully created."

  Scenario: modify task on a routine
    When I follow "Edit"
    And I modify the "title" of the task
    And I follow "Update"
    Then I should see the new task title

  Scenario: delete task from a routine
    When I follow "Delete on a task"
    And I follow "Okay"
    Then I should see the task removed from the routine
