Feature: display list of tasks for a routine

  As a busy office worker
  So that I can get to work on time in the morning
  I want to manage my morning tasks by reordering tasks

  Background: morning routine has been added to database

    Given the following routines exist:
      | title                         | description                           | mon  | tue | start_time  |
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

  Scenario: moving a task up
    When I follow "Morning Routine"
    And I follow the "up" button for the "Shower" task
    Then I should see "Shower" before "Make Coffee"

  Scenario: moving a task down
    When I follow "Morning Routine"
    And I follow the "down" button for the "Brush teeth" task
    Then I should see "Gather work things" before "Brush teeth"