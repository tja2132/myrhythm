Feature: Display and Add customized public routines

  As a MyRhythm user
  So I can find new ways of being efficient
  I would like discover new routines
  and add them to my routine list

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
    | title                         | description                           | mon  | wed  | start_time | is_public | home | work | school |
    | Evening Workout               | A quick evening workout               | true | true | 06:58:50   | true      | true | false | false |
    | Skincare Routine              | A simple skincare regiment            | true | false | 18:00:00  | false    | false | true | false |
    | The Perfect Grilled Cheese    | All the steps for a perfect sandwich  | false| false| 22:00:00   | true      | false | false | true |

    Given the following tasks exist for the "Evening Workout":
    | title              | description     | sequence | duration | routine_id |
    | Bicep curls       | 10 sets of 5     | 1        | 30       | 1          |

    And I am on the routines page
    Then I should see all the routines for the email "guest@columbia.edu"

  Scenario: Navigate to Discover Page
    When I follow "Discover"
    Then I should see "Discover"

  Scenario: Show Routine Details from Discover Page
    Given I am on the discover page
    And I follow "view_routine_1"
    Then I should see "Evening Workout"
    And I should see "Recurrence: Mon, Wed"
    And I should see "Total Duration: 30 min"
    And I should see "Start Time: 06:58am"
    And I should see "End Time: 07:28am"
    And I should see "Bicep curls"
    And I should see "10 sets of 5"

  Scenario: Quick-add Routine from Discover Page
    Given I am on the discover page
    And I follow "quick_add_routine_1"
    And I follow "My Routines"
    Then I should see "Evening Workout" 2 times

  Scenario: Modify and Add Routine from Discover Page
    Given I am on the discover page
    And I follow "copy_routine_1"
    And I fill in "Description" with "A long and arduous workout"
    And I press "Copy Routine"
    And I follow "My Routines"
    Then I should see "Evening Workout" 2 times
    Then I should see "A long and arduous workout"

  Scenario: Filter routines by tags on Discover Page
    When I follow "Discover"
    And I check "home"
    And I uncheck "school"
    And I uncheck "work"
    And I press "Refresh"
    Then I should see "Evening Workout"
    And I should not see "Skincare Routine"
    And I should not see "The Perfect Grilled Cheese"
