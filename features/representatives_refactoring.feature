Feature: Civic_api_to_representative_params refactoring
  As a client,
  the search for representatives feature should not add duplicate entries to the database,
  so the database does not become full with duplicate entries.
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
Scenario: Database is empty without any prior actions
  Then we should see 0 Joseph R. Biden in database