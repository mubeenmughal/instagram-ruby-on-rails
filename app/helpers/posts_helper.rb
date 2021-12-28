# frozen_string_literal: true

module PostsHelper
  def post_liked_by_user?(post_id)
    Like.where(post_id: post_id, user_id: current_user.id).any?
  end

  def followers(user)
    user.followers.any? { |follower| follower == current_user }
  end

  def search_like(post)
    Like.find_by(post_id: post.id, user_id: current_user).nil?
  end
end
