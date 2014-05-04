class AddNodeIdToTopic < ActiveRecord::Migration
  def change
    add_column :topics, :node_id, :integer
  end
end
