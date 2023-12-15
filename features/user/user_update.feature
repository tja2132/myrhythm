Feature: update default calendar page

  As a MyRhythm user
  So that I can customize my experience
  I want to change the default calendar page

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

Scenario: View Default Calendar page
  When I follow "Calendar"
  Then I should be on the weekly calendar page

Scenario: Update Default Calendar page
  When I follow "Me"
  And I select "Daily" from "Default Calendar View"
  And I press "Update Settings"
  Then I should see "User settings updated"
  When I follow "Calendar"
  Then I should be on the daily calendar page

Scenario: Update Default Insights Timeframe
  When I follow "Insights"
  Then I should see "My Stats: All Time"
  When I follow "Me"
  And I select "30" from "Default Number of Days Shown on Insights Page"
  And I press "Update Settings"
  Then I should see "User settings updated"
  When I follow "Insights"
  Then I should see "My Stats: Last 30 Days"
  When I follow "Me"
  And I select "90" from "Default Number of Days Shown on Insights Page"
  And I press "Update Settings"
  Then I should see "User settings updated"
  When I follow "Insights"
  Then I should see "My Stats: Last 90 Days"
