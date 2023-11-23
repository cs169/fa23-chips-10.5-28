# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'Oski' }
    last_name { 'Bear' }
    provider { :google_oauth2 }
    uid { 'google_uid' }
  end
end
