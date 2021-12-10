class Comment < ApplicationRecord
  # has_many_attached :avatar
  validates :description, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }

  belongs_to :user
  belongs_to :post
end
