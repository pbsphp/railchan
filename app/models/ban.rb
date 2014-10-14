class Ban < ActiveRecord::Base
  validates_presence_of :ip, :reason
end
