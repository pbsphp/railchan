class AddBumpedAtToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :bumped_at, :datetime

    add_index :topics, :bumped_at, order: { bumped_at: :desc }
  end
end
