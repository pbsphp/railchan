class Topic < ActiveRecord::Base
  belongs_to :board
  has_many :comments

  validates :text, length: { in: 2..1024 }
end
