# frozen_string_literal: true

class Follow < ApplicationRecord
  # The user giving the follow

  belongs_to :follower, class_name: 'User'

  # The user being followed
  #belongs_to :followee, foreign_key: :followed_id, class_name: 'User'

  validates_uniqueness_of :follower_id, scope: :followed_id
end
