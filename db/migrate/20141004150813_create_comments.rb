class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.string :subject
      t.string :email
      t.string :ip
      t.text :text

      t.timestamps
    end

    add_reference :comments, :topic, index: true
  end
end
