# Given /the following states exist/ do |states_table|
#   states_table.hashes.each do |state|
#     State.create!(name:         state['name'],
#                   symbol:       state['symbol'],
#                   fips_code:    state['fips_code'],
#                   is_territory: state['is_territory'],
#                   lat_min: 0, lat_max: 0, long_min: 0, long_max: 0,
#                   created_at: Time.current,
#                   updated_at: Time.current)
#   end
# end


# Given /the following counties exist/ do |counties_table|
#   counties_table.hashes.each do |country|
#     County.create!(name:       country['name'],
#                    state_id:   country['state_id'],
#                    fips_code:  country['fips_code'],
#                    fips_class: country['fips_class'],
#                    created_at: Time.current,
#                    updated_at: Time.current)
#   end
# end


# Background: Some states and counties are in database

#   Given the following states exist:
#   | name        | symbol | fips_code | is_territory |
#   | California  | CA     | 0         | true         |
#   | Florida     | FL     | 1         | true         |
#   | Virginia    | VA     | 2         | true         |

# Given the following counties exist:
# | name                     | state_id | fips_code | fips_class   |
# | San Mateo County         | 1        | 10        | some_class   |
# | San Fransisco County     | 2        | 20        | some_class   |
# | Broward County County    | 3        | 30        | some_class   |
# | Bedford County County    | 4        | 40        | some_class   |



Given /that I am on state (.*) on map/ do |state|
  # visit "/state/#{state}"
  state = URI.encode(state.downcase)
  # visit "state/#{state}"
  # state = state.downcase
  # puts "Visiting state: /state/#{state}" # Check the generated URL
  # binding.pry # Halt execution to inspect 'state' variable
  # visit "/state/#{state}"
  # visit "/representatives"
  # there is an error -> TA told me to use this way
  visit '/representatives'
  
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
  fill_in('address', :with => County)
  puts county
  binding.pry
  click_button('Search')
  # all_elements = page.all('*')
  # all_elements.each do |element|
  #   puts element.text # You can print other properties as well (e.g., element['data-county-name'])
  # end

end

Then /I should see (.*) in the list of representatives/ do |rep_names_list|
  rep_names = rep_names_list.split(',')
  rep_names.each do |rep_name|
    # puts rep_names
    # expect(page).not_to have_content(rep_name)
    expect(page).to have_content(rep_name)
  end
end