# frozen_string_literal: true

Given /that I am logged in/ do
  OmniAuth.config.test_mode = true
  Capybara.default_host = 'http://example.com'

  OmniAuth.config.add_mock(:google_oauth2, {
                             uid:  '12345',
                             info: {
                               first_name: 'Joe',
                               last_name:  'Biden',
                               email:      'joebiden@gmail.com'
                             }
                           })
  visit '/login'
  click_button('google_button')
end
