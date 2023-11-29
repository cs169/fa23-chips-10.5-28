# frozen_string_literal: true

require 'mocha'

Given /that I am on news items first page for (.*)/ do |name|
  Representative.create!({ name: name, ocdid: 1,
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })
  Representative.create!({ name: 'Alex Padilla', ocdid: 10,
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })

  @rep = Representative.where(name: name).first
  visit representative_new_my_news_item_path(@rep)
  find(:css, 'button.btn.btn-lg.btn-google.btn-block.text-uppercase.bg-danger.text-white',
       text: 'Sign in with Google').click
  visit representative_new_my_news_item_path(@rep)
  # expect(page).to have_current_path('representatives/1/representatives/1/my_news_item/new')
  
end

When /I select representative as (.*)/ do |name|
  # puts page.body
  # select(name, :from => '.form-control.#news_item_representative_id')
  # select_box = find('#news_item_representative_id.form-control', visible: :all, wait: 10)
  # select name, from: select_box
  # select name, :from => '#news_item_representative_id'
  
  # select_script = "document.querySelector('#news_item_representative_id').value = '#{name}';"
  # page.execute_script(select_script)

  # select_box = find('#news_item_representative_id.form-control', visible: :all, wait: 10)
  # select name, from: select_box

  # options = find('#news_item_representative_id').all('option').map(&:text)
  # expect(options).to include(name)
  
  select(name, :from => 'news_item_representative_id')
end

When /I select issue as (.*)/ do |issue|
  select(issue, :from => 'news_item_issue')
end

When /I hit the Search button/ do 
  # stubbed_articles = [
  #   { 'title' => 'Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19', 
  #     'link' => 'https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/', 
  #     'text' => 'The new order affects 19 California counties with a surging number of coronavirus cases' },
  #   { 'title' => 'Rethinking Americas Immigration Policy', 
  #   'link' => 'https://www.migrationpolicy.org/programs/us-immigration-policy-program/rethinking-us-immigration?gclid=CjwKCAiAvJarBhA1EiwAGgZl0M9mZKoNCeITuUhBGGBgwdm_zrosXtq_CuukHUA85NEeSRcnafGyxhoCqSEQAvD_BwE', 
  #   'text' => 'Building a reponsive and affective immigration system' },
  # ]
  # inst = NewsItem.new
  # NewsItem.any_instance.stubs(:query_news_api).returns(stubbed_articles)
  # allow(NewsItem).to receive(:query_news_api).and_return(stubbed_articles)
  # allow(inst).to receive(:query_news_api).and_return(stubbed_articles)
  # NewsItem.stubs(:query_news_api).returns(stubbed_articles)
  click_button('Search')
end

Then /I should now be on the second page for news item search/ do
  expected_page_path = representative_search_my_news_item_path(@rep)
  expect(page).to have_current_path(expected_page_path)
end

Then /I should have (.*) profile link/ do |name| 
  @test_rep = Representative.where(name: name).first
  id = @test_rep.id
  within('#rep-heading') do
    expect(page).to have_content("Representative: #{name}")
    expect(page).to have_link(name, href: "/representatives/#{id}")
  end
end

Then /I should see issue listed as (.*)/ do |issue|
  within('#issue-heading') do
    expect(page).to have_content("Issue: #{issue}")
  end
end

Then /I should see an article with title (.*)/ do |title|
  expect(page).to have_content("Title: #{title}")
end

Then /I should see an article with link (.*)/ do |link|
  expect(page).to have_link(link, href: link)
end

Then /I should see a description with (.*)/ do |description|
  expect(page).to have_content("Description: #{description}")
end

Then /I should see a selection for Rating for (.*)/ do |selection|
  expect(page).to have_content("Rating:")
  options = find('#rating').all('option').map(&:text)
  expect(options).to include(selection)
end

Then /I should see a button named (.*)/ do |button_name|
  expect(page).to have_selector('a.btn.btn-secondary', text: button_name)
end

When /I click for the (.*) button/ do |button_name|
  click_button(button_name)
end

Then /I should see (.*) articles list/ do |name|
  @test_rep = Representative.where(name: name).first
  expected_page_path = representative_news_items_path(@test_rep)
  expect(page).to have_current_path(expected_page_path)
end
