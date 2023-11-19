Feature: Civic_api_to_representative_params refactoring
  As a client,
  when customers use the search for representatives feature, duplicate entries should not be added to the database,
  so the database does not fill up with duplicate entries.
Scenario: Duplicate search should not show up in the database
  Given that Joseph Biden in database
  When I search California 
<<<<<<< HEAD
  Then we should not see two Joseph Biden in database



Feature: Display a representative's profile page
  As a researcher,
  I want to be able to read information about Joseph Biden
  so that I can write a biography 
Scenario:
  Given that Joseph Biden in database
  When I search California 
  When I click on Joseph Biden
  Then we should see his address and photo
=======
  Then we should not see two Joseph Biden in database
>>>>>>> 5fc512e32c83f472bd3b7be6b568d57bdf42dd6f
