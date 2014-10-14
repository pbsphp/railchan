class CreateBans < ActiveRecord::Migration
  def change
    create_table :bans do |t|
      t.string :ip, null: false
      t.string :reason, null: false
      t.datetime :expires_at

      t.timestamps
    end
    add_index :bans, :ip, unique: false
  end
end
