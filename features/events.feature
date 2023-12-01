Feature: Events list
  As a user of the site
  I would like to see a list of all events available
  So that I can make plans to participate
Scenario: Events list features
  Given that there is an event "Marching band"
  And that I am on "events"
  Then I should see "Marching band"
Scenario: Navigate to detailed event page
  Given that there is an event "Marching band"
  And that I am on "events"
  When I follow "View"
  Then I should see "Marching band"
  And I should see "Annual pride parade"
Scenario: Editing Events
  Given that there is an event "Marching band"
  And that I am logged in
  And that I am on "my_events/1"
  When I fill in "Military Parade" for "event_name"
  And I press "Save"
  Then I should see "Military Parade"
