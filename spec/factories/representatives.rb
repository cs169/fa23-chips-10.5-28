# frozen_string_literal: true

FactoryBot.define do
  factory :representative do
    name { 'Oski Bear' }
    ocdid { '0' }
    title { 'Mascot' }
    address { 'Cal' }
    photo { 'Bear image' }
    party { 'No Party lol' }
  end
end
