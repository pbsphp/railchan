class Board < ActiveRecord::Base
  belongs_to :boards_group
  has_many :topics

  validates :name, presence: true, uniqueness: true
end
