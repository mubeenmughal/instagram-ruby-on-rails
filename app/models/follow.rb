# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, class_name: 'User'

  validates :follower_id, uniqueness: { scope: :followed_id }

  scope :find_following_ids, ->(u_id) { where(follower_id: u_id).pluck(:followed_id) << u_id }
end
