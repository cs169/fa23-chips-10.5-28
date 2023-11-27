Feature: News Items first page for search
  Scenario:
    Given that I am on news items page for Joseph R. Biden with id 3
    When I click the Add News Article button
    Then I should see Representative and Issue selection
    Then in Representative selection I should see Joseph R. Biden
    Then in Representative selection I should see Ricardo Lara
    Then in Representative selection I should see Jimmy Patronis
    Then in Issue selection I should see Immigration
    Then in Issue selection I should see Terrorism
    Then in Issue selection I should see Racism
