Feature: Discover New Routines as a user of MyRhythm

  As a stressed student
  So that I can focus on my studies and get to class on time
  I want to manage my schedule more effectively

  Background: Routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
      | title                         | description                           | mon  | wed  | start_time |
      | Evening Workout               | A quick evening workout               | true | true | 06:58:50   |
      | Skincare Routine              | A simple skincare regiment            | true | false | 18:00:00   |
      | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false| 22:00:00   |

    And I am on the routines page
    Then I should see all the routines for the email "guest@columbia.edu"

  Scenario: Navigate to discover page
    When I follow "Discover"
    Then I should see "Discover"