Given /that I am on state (.*) on map/ do |state|
  visit '/state/#{state}'
end

When /I click on (.*) County/ do |county|
  find('.actionmap-view-region[data-county-name=#{county}]').click
end

Then /I should see (.*) in the list of representatives/ do |rep_names_list|
  rep_names = rep_names_list.split(',')
  rep_names.each do |rep_name|
    expect(page).not_to have_content(rep_name)
  end
end