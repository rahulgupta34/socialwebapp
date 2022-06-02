class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_one :post, dependent: :destroy
end
