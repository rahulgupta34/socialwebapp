class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :picture
  validates_presence_of :title, :body, :picture
end
