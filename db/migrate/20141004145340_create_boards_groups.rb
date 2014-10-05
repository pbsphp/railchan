class CreateBoardsGroups < ActiveRecord::Migration
  def change
    create_table :boards_groups do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
