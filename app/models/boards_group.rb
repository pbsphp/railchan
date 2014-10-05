class BoardsGroup < ActiveRecord::Base
  has_many :boards

  validates :name, format: { with: /\A\w+\z/ }
end
