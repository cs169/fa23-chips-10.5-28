Feature: News Items second page search results
  Scenario:
    Given that I am on news items first page for Joseph R. Biden
    When I select representative as Alex Padilla
    When I select issue as Immigration
    When I hit the Search button
    Then I should be on the second page for news item search
    Then I should have Alex Padilla profile link
    Then I should see issue listed as Immigration
    Then I should see an article with title Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19
    Then I should see an article with link https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/
    Then I should see a description with The new order affects 19 California counties with a surging number of coronavirus cases
    Then I should see a selection for Rating for 1
    Then I should see a selection for Rating for 2
    Then I should see a selection for Rating for 5
    Then I should see a selection for Rating for 10
    Then I should see a button named View News Articles
    When I click for the View News Articles button
    Then I should see Alex Padilla articles list