# frozen_string_literal: true

FactoryBot.define do
  factory :state do
    name { 'California' }
    symbol { 'CA' }
    fips_code { 1 }
    is_territory { true }
    lat_min { 0 }
    lat_max { 0 }
    long_min { 0 }
    long_max { 0 }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
