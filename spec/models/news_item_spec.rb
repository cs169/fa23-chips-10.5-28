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

  describe 'querying News api' do
    it 'generates right query string' do
      uri = described_class.generate_query_uri('Joe Biden', 'Abortion')
      expect(uri).to eq('https://newsapi.org/v2/everything?q=Joe Biden AND Abortion&' \
                        "from=#{Time.zone.today - 30.days}&sort_by=relevancy&")
    end

    it 'returns right list of articles' do
      setup_faraday_mocks
      article_list = described_class.query_news_api('Joe Biden', 'Abortion')
      expect(article_list.length).to eq(5)
      expect(article_list[0]['link']).to eq('www.google.com')
      expect(article_list[0]['text']).to eq('Close race')
    end
  end
end

def setup_faraday_mocks
  articles = []
  6.times do
    articles.append({ title: 'Election results', url: 'www.google.com', description: 'Close race' })
  end
  article_json = { articles: articles }.to_json

  faraday_reponse = instance_double(Faraday::Response)
  allow(faraday_reponse).to receive(:body).and_return(article_json)
  allow(Faraday).to receive(:get).and_return(faraday_reponse)
end
