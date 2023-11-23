# frozen_string_literal: true

Given /that (.*) in database/ do |name|
  Representative.create!({ name: name, ocdid: 'ocd-division/country:us',
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })
end

Given /that (.*) has a news article/ do |name|
  rep = Representative.where(name: name).first
  NewsItem.create!(
    {
      representative: rep,
      title:          'Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19',
      description:    'The new order affects 19 California counties with a surging number of coronavirus cases',
      link:           'https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/'
    }
  )
end

When /I search (.*)/ do |location|
  visit '/representatives'
  fill_in('address', with: location)
  click_button('Search')
end

When /I by class click on (.*)/ do |class_name|
  click_on(class: class_name)
end

Given /that I am on "([^"]*)"$/ do |route|
  visit route
end

Then /we should see ([0-9]+) (.*) in database/ do |count, name|
  reps = Representative.where(name: name)
  expect(reps.length).to eq count.to_i
end
