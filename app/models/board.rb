class Board < ActiveRecord::Base
  belongs_to :boards_group
  has_many :topics, dependent: :destroy

  validates :name, format: { with: /\A\w+\z/ }, uniqueness: true


  def destroy_old_topics
    max_topics_in_board = Settings.global.max_topics_in_board

    if (max_topics_in_board != 0) and (self.topics.count > max_topics_in_board)
      ids = self.topics.limit(max_topics_in_board).ids
      self.topics.where.not(id: ids).destroy_all
    end
  end

end
