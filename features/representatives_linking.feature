Feature: Display a representative's profile page
  As a researcher,
  I want to be able to search for a state's representatives and access their information
  so that I can write a biography 
Scenario:
  Given I am on the representatives search page
  When I search California 
  When I follow "Joseph R. Biden"
  Then I should be on representative 1's profile page
