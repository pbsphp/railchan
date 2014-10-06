class Reply < ActiveRecord::Base

  belongs_to :comment_requires_comments,
              foreign_key: :comment_reply_id, class_name: "Comment"

  belongs_to :comment_requires_topics,
              foreign_key: :topic_reply_id, class_name: "Topic"

  belongs_to :topic_requires_comments,
              foreign_key: :comment_reply_id, class_name: "Comment"

  belongs_to :topic_requires_topics,
              foreign_key: :topic_reply_id, class_name: "Topic"

end
