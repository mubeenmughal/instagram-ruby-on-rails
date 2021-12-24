module StoriesHelper

  def save_helper(story)
    if story.save
      redirect_to posts_path, flash: { success: 'story was created successfully' }
    else
      render @story, flash: { danger: story.errors }
    end
  end

  def destroy_helper(story)
    if story.destroy
      redirect_to posts_path, flash: { success: 'story was deleted successfully' }
    else
      render posts_path, flash: { danger: story.errors }
    end
  end
end
