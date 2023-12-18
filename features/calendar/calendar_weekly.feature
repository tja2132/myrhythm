Feature: View the weekly calendar page

  As a MyRhythm user
  So that I can plan ahead for the upcoming week
  I want to see a week's worth of routines at one time

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

  Scenario: navigate to the weekly calendar page
    When I follow "Calendar"
    Then I should see "My Week"
    And I should see the following: Mon, Tue, Wed, Thu, Fri, Sat, Sun
    And I should see the following: Skincare Routine, Evening Workout, Weekend Routine

  Scenario: routines are displayed on the correct days
    When I am on the weekly calendar page
    Then I should see "Mon" before "Skincare Routine"
    And I should see "Skincare Routine" before "Evening Workout"
    And I should not see "Weekend Routine" before "Sat"
    And I should see "Weekend Routine" after "Sun"