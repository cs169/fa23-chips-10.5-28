# frozen_string_literal: true

Given /that I am on news items page for (.*) with id (.*)/ do |name, id|
  Representative.create!({ name: name, ocdid: id,
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })
  NewsItem.create!({})
  visit "/representatives/3/news_items"
end

When /I click on Add News Article button/ do
  click_button('Add News Article')
end

Then /I should see Representative and Issue selection/ do
  if page.respond_to? :should
    page.should have_content('Representative')
    page.should have_content('Issue')
  else
    assert page.has_content?('Representative')
    assert page.has_content?('Issue')
  end
end

Then /in Representative selection I should see (.*)/ do |name|
  expect(page).to have_select('news_item_representative_id', with_options: [option_text])
end

Then /in Issue selection I should see (.*)/ do |name|
  expect(page).to have_select('news_item_issue', with_options: [option_text])
end
