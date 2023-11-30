# frozen_string_literal: true

Given /that I am on news items page for (.*) with id (.*)/ do |name, id|
  Representative.create!({ name: name, ocdid: id,
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })
  Representative.create!({ name: 'Jimmy Patronis', ocdid: 10,
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })
  Representative.create!({ name: 'Ricardo Lara', ocdid: 20,
    title: 'President of the United States', photo: '',
    address: '1600 Pennsylvania Avenue Northwest', party: 'Democrat' })

  @rep = Representative.where(name: name).first
  NewsItem.create!(
    {
      representative: @rep,
      title:          'Newsom Orders Second Shutdown of Restaurants and Indoor Businesses amid COVID-19',
      description:    'The new order affects 19 California counties with a surging number of coronavirus cases',
      link:           'https://people.com/human-interest/california-gov-gavin-newsom-orders-second-shutdown-of-restaurants-and-indoor-businesses-amid-covid-19/'
    }
  )
  visit representative_news_items_path(@rep.id)
end

When /I click the (.*) button/ do |button_name|
  find(:css, 'a.btn.btn-primary', text: button_name).click
  # pass the authentication
  find(:css, 'button.btn.btn-lg.btn-google.btn-block.text-uppercase.bg-danger.text-white',
       text: 'Sign in with Google').click
  visit representative_new_my_news_item_path(@rep)
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
  # expect(page).to have_select('news_item_representative_id', with_options: name)
  options = find('#news_item_representative_id').all('option').map(&:text)
  expect(options).to include(name)
end

Then /in Issue selection I should see (.*)/ do |name|
  options = find('#news_item_issue').all('option').map(&:text)
  expect(options).to include(name)
end
