Feature: Filter my Routines

  As a stressed student
  So that I can prioritize my work and get to class on time
  I want to filter my schedule more effectively

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password |
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
    | title                         | description                           | mon  | tue   | wed  | thu  | fri  | sat  | sun  | start_time |
    | Evening Workout               | A quick evening workout               | true | true  | true | true | true | true | true | 06:58:50   |
    | Skincare Routine              | A simple skincare regiment            | true | false | true | true | true | true | true | 18:00:00   |
    | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false | false| false| false| false| false| 22:00:00   |

    And I am on the routines page
    Then I should see all the routines for the email "guest@columbia.edu"

  Scenario: Filter routines by Daily
    When I check the following options: Daily
    And I press "Refresh"
    Then I should see "Evening Workout"
    And I should not see "Skincare Routine"
    And I should not see "The Perfect Grilled Cheese"

  Scenario: Filter routines by Weekly
    When I check the following options: Weekly
    And I press "Refresh"
    Then I should see "Skincare Routine"
    And I should not see "The Perfect Grilled Cheese"
    And I should not see "Evening Workout"

  Scenario: Filter routines by None
    When I check the following options: None
    And I press "Refresh"
    Then I should not see "Skincare Routine"
    And I should see "The Perfect Grilled Cheese"
    And I should not see "Evening Workout"