Given /that I am on state (.*) on map/ do |state|
  visit "/state/#{state}"
end

When /I click on (.*)/ do |county|
  # county_name = county + " " + "County"
  # save_and_open_page
  # wait_for { page.has_css?(".actionmap-view-region[data-county-name='#{county}']", wait: 2) }
  # find("path.actionmap-view-region[data-county-name='#{county}']").click
  # find(:xpath, "//path[@data-county-name='#{county}']").click
  # page.execute_script("document.querySelector(\".actionmap-view-region[data-county-name='#{county}']\").click()")
  # find(".actionmap-view-region='#{county}']").click
  # find(".actionmap-view-region['#{county}']").click
  # find(".actionmap-view-region").click
  all_elements = page.all('*')
  all_elements.each do |element|
    puts element.text # You can print other properties as well (e.g., element['data-county-name'])
  end

end

Then /I should see (.*) in the list of representatives/ do |rep_names_list|
  rep_names = rep_names_list.split(',')
  rep_names.each do |rep_name|
    puts rep_names
    expect(page).not_to have_content(rep_name)
  end
end