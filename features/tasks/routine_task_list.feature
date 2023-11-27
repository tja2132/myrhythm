Feature: display list of tasks for a routine

  As a busy office worker
  So that I can get to work on time in the morning
  I want to manage my morning tasks by creating a morning routine with several tasks

  Background: morning routine has been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
      | title                         | description                           | mon  | tue | start_time |
      | Morning Routine               | my morning routine                    | true | true| 06:30:00 |

    Given the following tasks exist for the "Morning Routine":
      | title              | description                                        | sequence | duration |
      | Make Coffee        | Start Kettle, Grind Coffee Beans, Brew Coffee      | 1        | 15       |
      | Shower             | Shower                                             | 2        | 15       |
      | Put on Clothes     | Get Dressed                                        | 3        | 15       |
      | Make Breakfast     | Grab egg bites from fridge and eat with toast      | 4        | 5        |
      | Take Meds          | be healthy!                                        | 5        | 1        |
      | Brush teeth        |                                                    | 6        | 3        |
      | Gather work things | Gather bookbag, laptop, badge, keys, phone, wallet | 7        | 10       |

    And I am on the routines page

  Scenario: add task to a routine
    When I follow "Morning Routine"
    And I follow "Add Task"
    And I fill in "Task Name" with "Morning Workout"
    And I press "Create Task"
    Then I should see "Task was successfully created."

  Scenario: adding a task to a routine with a non-zero duration increases the routine end time
    When I follow "Morning Routine"
    Then I should see "Total Duration: 64 minutes"
    And I should see "End Time: 07:34am"
    When I follow "Add Task"
    And I fill in "Task Name" with "Morning Workout"
    And I select "20" from "Minutes to complete task"
    And I press "Create Task"
    And I follow "Back to Routine"
    Then I should see "Total Duration: 84 minutes"
    And I should see "End Time: 07:54am"

  Scenario: editing a task within a routine
    When I follow "Morning Routine"
    And I follow "Brush teeth"
    And I follow the "edit" button for the "Brush teeth" task
    And I fill in "Description" with "Brush teeth for two minutes"
    And I press "Update Task"
    Then I should see "Task was successfully updated."