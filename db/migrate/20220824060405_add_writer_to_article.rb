class AddWriterToArticle < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :writer, :string
  end
end
