class CreateNode < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :name, :description
    end
  end
end
