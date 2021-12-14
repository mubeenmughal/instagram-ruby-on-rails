class Comment < ApplicationRecord
  # has_many_attached :avatar

  belongs_to :user
  belongs_to :post

  validates :description, length: { maximum: 1000,
    too_long: "%{count} characters is the maximum allowed" }

  #  validates_presence_of :Comment
  #  validates_presence_of :user_id
   validates_presence_of :post_id


end
