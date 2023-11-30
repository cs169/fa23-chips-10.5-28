# frozen_string_literal: true

# stale; js driver not functional
And /I create a new event named (.*)/ do |name|
  state = State.create({
    name:         'California',
    symbol:       'CA',
    fips_code:    '06',
    is_territory: 0,
    lat_min:      '-124.409591',
    lat_max:      '-114.131211',
    long_min:     '32.534156',
    long_max:     '-114.131211'})
  county = state.counties.create({
    "fips_code": "001",
    "name": "Alameda County",
    "fips_class": "H1"
  })

  visit('/my_events/new')
  fill_in('Name', with: name)
  fill_in('Description', with: name+' Description')
  select("California", :from => "actionmap-event-state")
  # Following line uses javascript
  # select("Alameda County", :from => "actionmap-event-county")
  # TODO: Select date information
  click_button('Save')
end

Then /I am redirected to (.*)/ do |name|
end 

And /there is an event named (.*)/ do |name|
end 

And /I edit the (.*) event/ do |name|
end 

When /I set the name to (.*)/ do |name|
end 

When /I set the description to (.*)/ do |desc|
end 

And /its description is (.*)/ do |desc|
end

And /I save the event/ do
end