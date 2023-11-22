# frozen_string_literal: true

Given /that I am on state (.*) on map/ do |state|
  # visit "/state/#{state}"
  # state = URI.encode(state.downcase)
  # visit "state/#{state}"
  # state = state.downcase
  # puts "Visiting state: /state/#{state}" # Check the generated URL
  # binding.pry # Halt execution to inspect 'state' variable
  # visit "/state/#{state}"
  # visit "/representatives"
  # there is an error -> TA told me to use this way
  # visit '/representatives'
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
  # fill_in('address', :with => county)
  # puts county
  # binding.pry
  # click_button('Search')
  county = URI::Parser.new.escape(county)
  visit "/search/#{county}"
  # all_elements = page.all('*')
  # all_elements.each do |element|
  #   puts element.text # You can print other properties as well (e.g., element['data-county-name'])
  # end
end

Then /I should see (.*) in the list of representatives/ do |rep_names_list|
  rep_names = rep_names_list.split(',')
  rep_names.each do |rep_name|
    expect(page).to have_content(rep_name)
  end
end
