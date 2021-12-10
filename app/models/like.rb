# frozen_string_literal: true

class Like < ApplicationRecord
  # has_many_attached :avatar
  belongs_to :post
  belongs_to :user
end
