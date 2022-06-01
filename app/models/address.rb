class Address < ApplicationRecord
  belongs_to :user
  validates_presence_of :country, :pincode, :address, :state
end
