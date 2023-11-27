# frozen_string_literal: true

require 'news-api'

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_issues_list
  before_action :set_news_item, only: %i[edit update destroy]

  def new
    @news_item = NewsItem.new
  end

  def search
    # "news_item"=>{"representative_id"=>"3", "issue"=>"Gun Control"}
    @representative = Representative.find(
      params[:news_item][:representative_id]
    )
    @rep_name = @representative.name
    @issue = params[:news_item][:issue]
    # service = News.new(Rails.application.credentials[:NEWS_API_KEY])
    topic = @rep_name + ' ' + @issue
    service = News.new("165fc53b54244e7d97f7f2c9919767c4")
    found_news = service.get_everything(
      q: topic,
      # category: , 
      language: 'en',
      # country: 'us',
      from: '2017-12-01',
      to: '2023-11-20',
      sortBy: 'popularity',
      page: 5
    

    # puts found_news

      # q: 'bitcoin',
      # category: 'business',
      # language: 'en',
      # country: 'us'
    )
    # news = service.get_sources(country: 'us', language: 'en')
    binding.pry
  end

  def search_result
  end

  def edit; end

  def create
    @news_item = NewsItem.new(news_item_params)
    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_issues_list
    @issues_list = ["Free Speech", "Immigration", "Terrorism", "Social Security and
    Medicare", "Abortion", "Student Loans", "Gun Control", "Unemployment",
    "Climate Change", "Homelessness", "Racism", "Tax Reform", "Net
    Neutrality", "Religious Freedom", "Border Security", "Minimum Wage",
    "Equal Pay"]
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:news, :title, :description, :link, :representative_id, :issue)
  end
end
