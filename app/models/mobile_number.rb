class MobileNumber < ActiveRecord::Base
  has_many :contacts
  has_many :messages
end
