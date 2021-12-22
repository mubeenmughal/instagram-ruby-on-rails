# frozen_string_literal: true

class Story < ApplicationRecord
  has_many_attached :images
  validates :description, length: { maximum: 1000,
                                    too_long: '%{count} characters is the maximum allowed' }

  # belongs_to :user, optional: true
  belongs_to :user
  after_save :remove_story


  private
    def remove_story
      RemoveStoryJob.set(wait: 5.seconds).perform_later(self)
    end
end
