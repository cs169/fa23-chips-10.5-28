Given /that (.*) in database/ do |name|
  Representative.create!({ name: name, ocdid: 'ocd-division/country:us',
    title: "President of the United States" })
end

When /I search (.*)/ do |location|
  visit '/representatives'
  fill_in('address', :with => location)
  click_button('Search')
end

Then /we should see ([0-9]+) (.*) in database/ do |count, name|
  reps = Representative.where(name: name)
  expect(reps.length).to eq count.to_i
end
