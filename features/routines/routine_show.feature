Feature: Display all Information for a Routine

  As a stressed student
  So that I can focus on my studies
  I want to update and view my routines effectively

  Background: routines have been added to database

    Given the following user exists and is logged in:
    | first_name | last_name | columbia_uni | email              | password | 
    | Guest      | User      | aaaa1234     | guest@columbia.edu | 1234qwer |

    Given the following routines exist for the user "guest@columbia.edu":
    | title                       | description                        | mon  | tue | wed | thu | fri | sat | sun  | start_time | home |
    | Study Routine               | A nightly study plan               | true | true| true| true| true| true| false| 12:00:00   | true |

    And I am on the routines page
    Then I should see "Study Routine"

  Scenario: View the Routine
    Given I am on the routines page
    When I follow "Study Routine"
    Then I should see "Study Routine"
    And I should see "Recurrence: Mon, Tue, Wed, Thu, Fri, Sat"
    And I should see "Total Duration: 0 min"
    And I should see "Start Time: 12:00pm"
    And I should see "End Time: 12:00pm"
    And I should see "Tags: Home"
