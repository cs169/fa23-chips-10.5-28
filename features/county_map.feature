Feature: County Map Functionality For Getting Representatives
  Scenario: Clicking on San Mateo County to get the representatives
    Given that I am on state CA on map
    When I click on San Mateo County
    Then I should see Nancy Magee, Stephen M. Wagstaffe, Mark Church, Juan Raigoza in the list of representatives
  Scenario: Clicking on San Fransisco County to get the representatives
    Given that I am on state CA on map
    When I click on San Fransisco County
    Then I should see London Breed, David Chiu, Manohar Raju, Juan Raigoza, Brooke Jenkins in the list of representatives
  Scenario: Clicking on Broward County to get the representatives
    Given that I am on state FL on map
    When I click on Broward County
    Then I should see Marty Kiar, Gregory Tony, Joe Scott, Brenda D. Forman in the list of representatives
  Scenario: Clicking on Broward County to get the representatives
    Given that I am on state VA on map
    When I click on Bedford County
    Then I should see Judy E. Reynolds, Kim Snow, Mike W. Miller, Tracy Patterson in the list of representatives