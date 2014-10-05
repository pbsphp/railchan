class Topic < ActiveRecord::Base
  belongs_to :board
  has_many :comments

  validates :text, length: { in: 2..1024 }

  default_scope { order("bumped_at DESC") }

  before_create :initialize_with_current_timestamp


  def bump
    # Can be called from another models, do not do it private!
    self.update_columns(bumped_at: Time.now.utc)
  end


  private


  def initialize_with_current_timestamp
    self.bumped_at = Time.now.utc
  end

end
