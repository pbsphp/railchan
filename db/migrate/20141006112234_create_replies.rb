class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.integer :comment_reply_id,      null: true
      t.integer :topic_reply_id,        null: true
      t.integer :comment_reply_to_id,   null: true
      t.integer :topic_reply_to_id,     null: true
    end

    add_index :replies, :comment_reply_id,      unique: false
    add_index :replies, :topic_reply_id,        unique: false
    add_index :replies, :comment_reply_to_id,   unique: false
    add_index :replies, :topic_reply_to_id,     unique: false
  end
end
