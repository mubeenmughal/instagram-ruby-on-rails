# frozen_string_literal: true

class Post < ApplicationRecord
  has_many_attached :images
  validates :description,length: { maximum: 1000,
                                                    too_long: '%{count} characters is the maximum allowed' }


                                                    
  belongs_to :user
end
