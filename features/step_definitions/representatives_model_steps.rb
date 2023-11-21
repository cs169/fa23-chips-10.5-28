# frozen_string_literal: true

Given /that (.*) in database/ do |name|
  Representative.create!({ name: name, ocdid: 'ocd-division/country:us',
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })
end

When /I search (.*)/ do |location|
  visit '/representatives'
  fill_in('address', with: location)
  click_button('Search')
end

Given /that I am on "([^"]*)"$/ do |route|
  visit route
end

Then /we should not see two (.*) in database/ do |name|
  reps = Representative.where(name: name)
  expect(reps.length).to eq 1
end
