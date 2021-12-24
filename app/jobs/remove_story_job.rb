# frozen_string_literal: true

class RemoveStoryJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    args.first.destroy
    redirect_to posts_path
  end
end
