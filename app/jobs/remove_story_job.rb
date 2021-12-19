class RemoveStoryJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    args.first.destroy
  end
end
