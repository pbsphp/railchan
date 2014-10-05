class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name, null: false
      t.string :title

      t.timestamps
    end

    add_reference :boards, :boards_group, index: true
  end
end
