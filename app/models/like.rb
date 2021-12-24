# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :post_id, uniqueness: { scope: :user_id }

  scope :find_ids, ->(p_id, u_id) { where(post_id: p_id, user_id: u_id) }
end
