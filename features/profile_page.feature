Feature: Display a representative's profile page
  As a researcher,
  I want to be able to read information about Joseph R. Biden
  so that I can write a biography 
Scenario:
  Given that Joseph R. Biden in database
  When I search California 
  When I click on Joseph R. Biden
  Then we should see his address and photo