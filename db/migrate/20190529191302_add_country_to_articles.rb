class AddCountryToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :country, :string
  end
end
