# frozen_string_literal: true

class Post < ApplicationRecord
  has_many_attached :images
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  validates :images, presence: true,
                     blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validates :description, length: { maximum: 1000,
                                    too_long: '%<count>s characters is the maximum allowed' }
end
