Feature: Sort my routines

  As a stressed student
  So that I can prioritize my work and get to class on time
  I want to sort my schedule more effectively

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
      | title                         | description                           | mon  | wed  | start_time |
      | Evening Workout               | A quick evening workout               | true | true | 06:58:50   |
      | Skincare Routine              | A simple skincare regiment            | true | false | 18:00:00   |
      | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false| 22:00:00   |

    Given the following tasks exist for the "Skincare Routine":
      | title              | description                                        | sequence | duration |
      | Wash face          | Wash your face                                     | 1        | 2        |
      | Shower             | Shower                                             | 2        | 15       |

    Given the following tasks exist for the "The Perfect Grilled Cheese":
      | title              | description                                        | sequence | duration |
      | Buy cheese         | Buy my favorite cheese                             | 1        | 30       |
      | Make sandwich      | Make the sandwich                                  | 2        | 15       |

    And I am on the routines page
    Then I should see all the routines for the email "guest@columbia.edu"

  Scenario: Sort routines by name
    When I follow "Name"
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Evening Workout" before "The Perfect Grilled Cheese"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"

  Scenario: Sort routines by start time
    When I follow "Start Time"
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Evening Workout" before "The Perfect Grilled Cheese"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"

  Scenario: Sort routines by end time
    When I follow "End Time"
    #Then I should be on the MyRhythm home page sorted by "end_time"
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Evening Workout" before "The Perfect Grilled Cheese"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"

  Scenario: Sort routines by recurrence
    When I follow "Recurrence"
    And I refresh the page
    Then I should see "The Perfect Grilled Cheese" before "Skincare Routine"
    And I should see "The Perfect Grilled Cheese" before "Evening Workout"
    And I should see "Evening Workout" before "Skincare Routine"

  Scenario: Sort routines by total duration
    When I follow "Total Duration"
    And I refresh the page
    Then I should see "Evening Workout" before "Skincare Routine"
    And I should see "Skincare Routine" before "The Perfect Grilled Cheese"