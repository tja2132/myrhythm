Feature: display list of tasks for a routine

  As a busy office worker
  So that I can get to work on time in the morning
  I want to manage my morning tasks

  Background: morning routine has been added to database

    Given the following routines exist:
      | title                         | description                           | recurrence | daysofweek       | start_time                   |
      | Morning Routine               | my morning routine                    | Weekly     | M,W,F            | Time.local(2023, 1, 1, 6, 0)  |

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

  Scenario: view all tasks
    When I follow "Morning Routine"
    And I follow "All Tasks"
    Then I should see "Morning Routine Tasks"

  Scenario: add task to a routine
    When I follow "Morning Routine"
    And I follow "Add Task"
    And I fill in "Title" with "Morning Workout"
    And I press "Create Task"
    Then I should see "Task was successfully created."

#  Scenario: delete task from a routine
#    When I follow "Delete on a task"
#    And I follow "Okay"
#    Then I should see the task removed from the routine
