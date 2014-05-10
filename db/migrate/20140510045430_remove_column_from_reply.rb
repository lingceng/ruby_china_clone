class RemoveColumnFromReply < ActiveRecord::Migration
  def change
    remove_column :replies, :floor
  end
end
