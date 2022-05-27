class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates_presence_of :body, presence: true, length: { minimum: 3 }
end
