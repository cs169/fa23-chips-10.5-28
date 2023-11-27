# frozen_string_literal: true

class NewsItem < ApplicationRecord
  belongs_to :representative
  has_many :ratings, dependent: :delete_all

  def self.find_for(representative_id)
    NewsItem.find_by(
      representative_id: representative_id
    )
  end

  def self.query_news_api (rep_name, issue)
    #Rails.application.credentials[:NEWS_API_KEY]
    uri = "https://newsapi.org/v2/everything?" +
      "q=#{rep_name} AND #{issue}&" + 
      "from=#{(Date.today - (30.days)).to_s}&" +
      "sort_by=relevancy&" + 
      "apiKey=#{Rails.application.credentials[:NEWS_API_KEY]}"
      
      uri = URI.escape(uri)
      response = Faraday.get(uri)
      
      #response.body
  end
end
