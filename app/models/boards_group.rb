class BoardsGroup < ActiveRecord::Base
  has_many :boards

  validates :name, presence: true
end
