class MobileNumber < ActiveRecord::Base
  has_many :contacts
  has_many :messages
  has_many :images
  has_many :locations
end
