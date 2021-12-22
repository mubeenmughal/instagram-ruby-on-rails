# frozen_string_literal: true

class Follow < ApplicationRecord
   belongs_to :follower, class_name: 'User'


  validates_uniqueness_of :follower_id, scope: :followed_id

  scope :find_following_ids, lambda { |u_id| where(follower_id: u_id).pluck(:followed_id) << u_id}
end
