# frozen_string_literal: true

class AddRatingToNewsArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :news_items, :rating, :integer
  end
end
