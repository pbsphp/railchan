class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies, id: false do |t|
      t.integer :to_connect_id, null: false
      t.integer :from_connect_id, null: false
      t.string :to_connect_type, null: false
      t.string :from_connect_type, null: false
    end

    add_index :replies, [:to_connect_id, :from_connect_id], unique: false
  end
end
