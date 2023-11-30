Feature: My Events
  As a user of the site
  I want to be able to create events
  So that other users can be made aware of them

Scenario: Creating my event
  Given that I am logged in
  Given I am on /my_events/new
#  And I create a new event named "Test"
#  Then I am redirected to /events
#  And there is an event named "Test"

Scenario: Updating my event
  Given that I am logged in
  And I am on /my_events/new
#  And I create a new event named "Test"
#  Then I am on /events
#  And I edit the "Test" event
#  When I set the name to "Test2"
#  And I set the description to "Test Description 2"
#  And I save the event
#  Then there is an event named "Test2"
#  And its description is "Test Description 2"