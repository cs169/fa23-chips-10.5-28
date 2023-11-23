# frozen_string_literal: true

# needed to create Factory for representatives and news_items

require 'rails_helper'

RSpec.describe NewsItem, type: :model do
  describe 'calling the find_for' do
    # must use let! for eager evaluation
    let!(:representative) { create(:representative) }
    let!(:news_item) { create(:news_item, representative: representative) }

    it 'finds the news_item for the given representative id' do
      found_news_item = described_class.find_for(representative.id)
      expect(found_news_item).to eq(news_item)
    end
  end
end
