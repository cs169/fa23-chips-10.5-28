# frozen_string_literal: true

FactoryBot.define do
  factory :news_item do
    sequence(:title) { |n| "Some Title #{n}" }
    sequence(:link) { 'Some link' }
    description { 'Some news description.' }
    representative_id { FactoryBot.create(:representative).id }
  end
end
