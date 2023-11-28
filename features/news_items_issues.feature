Feature: News items can have issues
As a user,
I want to be able to see which issue a news article is about on the news article page 
and to be able to choose which issue a news article is about,
so I can be able to quickly find the articles that are relevant to me.
Scenario: Editing News Item
Given that Gavin Newson in database
And that Gavin Newson has a news article
And that I am logged in
And that I am on "representatives/1/representatives/1/my_news_item/1"
When I select "Free Speech" from "news_item_issue"
And I press "Save"
Then I should see "Free Speech"
