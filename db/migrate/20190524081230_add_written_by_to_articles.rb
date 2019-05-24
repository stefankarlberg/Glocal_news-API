class AddWrittenByToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :written_by, :string
  end
end
