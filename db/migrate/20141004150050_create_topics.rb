class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :author
      t.string :subject
      t.string :email
      t.string :ip
      t.text :text

      t.timestamps
    end

    add_reference :topics, :board, index: true
  end
end
