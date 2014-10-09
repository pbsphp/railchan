class BoardsGroup < ActiveRecord::Base
  has_many :boards, dependent: :destroy

  validates :name, presence: true
end
