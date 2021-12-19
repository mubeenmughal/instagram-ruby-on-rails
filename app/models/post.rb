# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc}
  has_many_attached :images
  validates :images, presence: true
  validates :description,length: { maximum: 1000,
                                                    too_long: '%{count} characters is the maximum allowed' }
  has_many :comments, dependent: :destroy
  has_many :likes , dependent: :destroy
  belongs_to :user


end
