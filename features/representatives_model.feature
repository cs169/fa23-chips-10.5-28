Feature: Civic_api_to_representative_params refactoring
  As a client,
  when customers use the search for representatives feature, duplicate entries should not be added to the database,
  so the database does not fill up with duplicate entries.
Scenario: Duplicate search should not show up in the database
  Given that Joseph R. Biden in database
  When I search California 
  Then we should not see two Joseph R. Biden in database
