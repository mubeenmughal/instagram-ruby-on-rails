# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc}
  has_many_attached :images
  validates :description,length: { maximum: 1000,
                                                    too_long: '%{count} characters is the maximum allowed' }
  has_many :comments
  has_many :likes
  belongs_to :user

  def total_likes
    0
  end
end
