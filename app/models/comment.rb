class Comment < ActiveRecord::Base
  belongs_to :topic

  default_scope { order("created_at ASC") }

  validates :text, length: { in: 2..1024 }
end
