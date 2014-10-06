class Comment < ActiveRecord::Base
  belongs_to :topic

  default_scope { order("created_at ASC") }

  validates :text, length: { in: 2..1024 }

  after_create :bump_topic

  has_many :replies,
            -> { where(from_connect_type: "Comment") },
            foreign_key: :from_connect_id


  def comment_reply_ids
    reps = self.replies.select { |r| r.to_connect_type == "Comment" }
    reps.collect(&:to_connect_id)
  end


  def topic_reply_ids
    reps = self.replies.select { |r| r.to_connect_type == "Topic" }
    reps.collect(&:to_connect_id)
  end


  private


  def bump_topic
    if self.email != "sage"
      Topic.find(self.topic_id).bump
    end
  end

end
