class CreateReply < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :user_id, :topic_id, :floor
      t.string :content

      t.timestamps
    end
  end
end
