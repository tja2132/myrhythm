<<<<<<< HEAD:features/routines/routine_discover.feature
Feature: Discover New Routines as a user of MyRhythm
=======
Feature: discover new routines
>>>>>>> 10ddc2207c5ee03ce1b109745f907f57b6d640cc:features/routines/discover_page.feature

  As a stressed student
  So that I can focus on my studies and get to class on time
  I want to manage my schedule more effectively

  Background: Routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
      | title                         | description                           | mon  | wed  | start_time | is_public | home | school |
      | Evening Workout               | A quick evening workout               | true | true | 06:58:50   | true      | true | false  |
      | Skincare Routine              | A simple skincare regiment            | true | false | 18:00:00   | false | false   | false  |
      | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false| 22:00:00   | true | false     | true   |

    And I am on the routines page
    Then I should see all the routines for the email "guest@columbia.edu"

  Scenario: Navigate to discover page
    When I follow "Discover"
<<<<<<< HEAD:features/routines/routine_discover.feature
    Then I should see "Discover"
=======
    Then I should see "Discover"
    And I should see "Evening Workout"
    And I should not see "Skincare Routine"

  Scenario: Filter routines by home tag
    When I follow "Discover"
    And I check the following options: home
    And I press "Refresh"
    Then I should see "Evening Workout"
    And I should not see "Skincare Routine"
    And I should not see "The Perfect Grilled Cheese"

  Scenario: Filter routines by school tag
    When I follow "Discover"
    And I check the following options: school
    And I press "Refresh"
    And I should see "The Perfect Grilled Cheese"
    Then I should not see "Evening Workout"
    And I should not see "Skincare Routine"
>>>>>>> 10ddc2207c5ee03ce1b109745f907f57b6d640cc:features/routines/discover_page.feature
