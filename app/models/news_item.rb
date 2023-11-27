# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  # Takes string for representative name and issue
  # Returns list of 5 articles, articles are hashes
  def self.query_news_api(rep_name, issue)
    uri = 'https://newsapi.org/v2/everything?' \
          "q=#{rep_name} AND #{issue}&" \
          "from=#{Date.today - 30.days}&" \
          'sort_by=relevancy&' \
          "apiKey=#{Rails.application.credentials[:NEWS_API_KEY]}"

    uri = URI.escape(uri)
    response = Faraday.get(uri)

    response_articles = JSON.parse(response.body)['articles']
    articles_list = []

    5.times do |i|
      org_article = response_articles[i]
      article = {}
      article['title'] = org_article['title']
      article['link'] = org_article['url']
      article['text'] = org_article['description']
      articles_list[i] = article
    end

    articles_list
  end
end
