Feature: Events list
  As a user of the site
  I would like to see a list of all events avaliable
  So that I makes plans to participate
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