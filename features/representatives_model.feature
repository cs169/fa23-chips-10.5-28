Feature: Civic_api_to_representative_params refactoring
  As a client,
  when customers use the search for representatives feature, duplicate entries should not be added to the database,
  so the database does not fill up with duplicate entries.
Scenario: Duplicate search should not show up in the database
  Given that Joseph R. Biden in database
  When I search California 
  Then we should see 1 Joseph R. Biden in database
Scenario: New candidates should be added to the database
  When I search California 
  Then we should see 1 Joseph R. Biden in database
Scenario: Multiple searches should only add candidate once
  When I search California 
  When I search California 
  Then we should see 1 Joseph R. Biden in database