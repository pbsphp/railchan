class Board < ActiveRecord::Base
  belongs_to :boards_group
  has_many :topics

  validates :name, format: { with: /\A\w+\z/ }, uniqueness: true
end
