Feature: Civic_api_to_representative_params refactoring
  As a developer
  when I come back to develop this civic_api_to_representative_params 
  in the future, I want it to be correct and understandable with comments 
  about what it is doing
Scenario: Duplicate search should not show up in the database
  Given that Joseph R. Biden in database
  When I search California 
  Then we should not see two Joseph R. Biden in database