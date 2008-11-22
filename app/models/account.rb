class Account < ActiveRecord::Base
  belongs_to :user
  has_many :drive_fixeds
end
