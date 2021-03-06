class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies, dependent: :destroy

  validates_presence_of :body, length: { minimum: 3 }
end
