Feature: View the daily calendar page

  As a MyRhythm user
  So that I can plan ahead for the day
  I want to see today's routines at a glance

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
    | title                         | description                           | mon  | wed  | thu  | sat  | sun  | start_time |
    | Evening Workout               | A quick evening workout               | true | true | true | true | true | 18:00:00   |
    | Skincare Routine              | A simple skincare regiment            | true | false| false| false| false| 08:00:00   |
    | Weekend Routine               | A great way to start the weekend      | false| false| false| true | true | 12:00:00   |

    And I am on the routines page

  Scenario: Navigate through the daily calendar pages
    When I follow "Calendar"
    And I follow "Mon"
    Then I should see "My Monday"
    And I follow "Tue"
    Then I should see "My Tuesday"
    And I follow "Wed"
    Then I should see "My Wednesday"
    And I follow "Thu"
    Then I should see "My Thursday"
    And I follow "Fri"
    Then I should see "My Friday"
    And I follow "Sat"
    Then I should see "My Saturday"
    And I follow "Sun"
    Then I should see "My Sunday"
