class Topic < ActiveRecord::Base
  belongs_to :board
  has_many :comments, dependent: :destroy

  validates :text, length: { in: 2..1024 }

  default_scope { order("bumped_at DESC") }

  scope :with_replies, -> { includes(:comment_replies, :topic_replies) }
  scope :with_comment_replies,
        -> { includes(comments: [:comment_replies, :topic_replies]) }

  before_create :initialize_with_current_timestamp
  after_create :parse_replies
  after_create :destroy_old_topics

  has_many :replies, foreign_key: :topic_reply_to_id, dependent: :destroy

  has_many :comment_replies,
            through: :replies,
            source: :topic_requires_comments,
            class_name: "Comment"

  has_many :topic_replies,
            through: :replies,
            source: :topic_requires_topics,
            class_name: "Topic"


  def bump
    if self.comments.count <= Settings.topic.bumplimit
      self.update_columns(bumped_at: Time.now.utc)
    end
  end


  private


  def initialize_with_current_timestamp
    self.bumped_at = Time.now.utc
  end


  def parse_replies
    comment_ids = self.text.scan(/>>(\d+)/).flatten
    topic_ids = self.text.scan(/>>T(\d+)/).flatten

    comment_ids.uniq.each do |comment_id|
      comment = Comment.find_by_id(comment_id)
      if comment.present?
        comment.topic_replies << self
      end
    end

    topic_ids.uniq.each do |topic_id|
      topic = Topic.find_by_id(topic_id)
      if topic.present?
        topic.topic_replies << self
      end
    end
  end


  def destroy_old_topics
    self.board.destroy_old_topics
  end

end
