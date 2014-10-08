class Comment < ActiveRecord::Base
  belongs_to :topic

  default_scope { order("created_at ASC") }

  validates :text, length: { in: 2..1024 }

  after_create :bump_topic
  after_create :parse_replies

  has_many :replies, foreign_key: :comment_reply_to_id

  has_many :comment_replies,
            through: :replies,
            source: :comment_requires_comments,
            class_name: "Comment"

  has_many :topic_replies,
            through: :replies,
            source: :comment_requires_topics,
            class_name: "Topic"


  private


  def bump_topic
    if self.email != "sage"
      Topic.find(self.topic_id).bump
    end
  end


  def parse_replies
    comment_ids = self.text.scan(/>>(\d+)/).flatten
    topic_ids = self.text.scan(/>>T(\d+)/).flatten

    comment_ids.uniq.each do |comment_id|
      comment = Comment.find_by_id(comment_id)
      if comment.present?
        comment.comment_replies << self
      end
    end

    topic_ids.uniq.each do |topic_id|
      topic = Topic.find_by_id(topic_id)
      if topic.present?
        topic.comment_replies << self
      end
    end

  end

end
