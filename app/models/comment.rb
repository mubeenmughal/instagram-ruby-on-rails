# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :description, presence: true, length: { maximum: 100,
                                                    too_long: '%{count} characters is the maximum allowed' }
  validates :post_id, presence: true
end
