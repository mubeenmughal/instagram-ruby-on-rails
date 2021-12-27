# frozen_string_literal: true

class Story < ApplicationRecord
  has_many_attached :images
  belongs_to :user

  validates :images, presence: true,
                     blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..(5.megabytes) }
  validates :description, length: { maximum: 1000,
                                    too_long: '%<count>s characters is the maximum allowed' }

  after_save :remove_story

  private

  def remove_story
    RemoveStoryJob.set(wait: 10.minutes).perform_later(self)
  end
end
