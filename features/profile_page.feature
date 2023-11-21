Feature: Display a representative's profile page
  As a researcher,
  I want to be able to read a representative's information
  so that I can write a biography 
Scenario:
  Given that Joseph Biden in database
  Given that I am on "representatives/1"
  Then I should see "Democrat"
  Then I should see "1600 Pennsylvania Avenue Northwest"

