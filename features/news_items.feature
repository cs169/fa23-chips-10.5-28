Feature: Display news item info
Given that I am a researcher,
I would like to know the name of the article, a description of the article, etc.
so that I can quickly understand what a newsarticle is about
Scenario:Navigating to news article #
  Given that Gavin Newson in database
  And that Gavin Newson has a news article
  And that I am on "representatives/1/news_items"
  When I by class click on article_link
  Then I should see "Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19"
  Then I should see "The new order affects 19 California counties with a surging number of coronavirus cases"