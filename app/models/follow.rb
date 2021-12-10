# frozen_string_literal: true

class Follow < ApplicationRecord
  # The user giving the follow
  belongs_to :follower, class_name: 'User'

  # The user being followed
  belongs_to :followed_user, foreign_key: :followed_id, class_name: 'User'
end
