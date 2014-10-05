class Comment < ActiveRecord::Base
  belongs_to :topic

  default_scope { order("created_at ASC") }

  validates :text, length: { in: 2..1024 }

  after_create :bump_topic


  private


  def bump_topic
    if self.email != "sage"
      Topic.find(self.topic_id).bump
    end
  end

end
