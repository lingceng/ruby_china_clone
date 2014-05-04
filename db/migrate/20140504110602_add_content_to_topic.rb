class AddContentToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :content, :string
  end
end
