class User < ApplicationRecord
  rolify

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :replies, dependent: :destroy
  has_one_attached :image
  validates :image, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:normal) if self.roles.blank?
  end
end
