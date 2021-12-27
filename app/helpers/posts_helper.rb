# frozen_string_literal: true

module PostsHelper
  def post_liked_by_user?(post_id)
    Like.where(post_id: post_id, user_id: current_user.id).any?
  end

  def save_helper(post)
    if post.save
      redirect_to post_path(post.id), flash: { success: 'post was created successfully' }
    else
      render new_post_path, flash: { danger: post.errors }
    end
  end

  def destroy_helper(post)
    if post.destroy
      redirect_to post_path(post.id), flash: { success: 'Post was deleted successfully' }
    else
      render new_post_path, flash: { danger: post.errors }
    end
  end
end
