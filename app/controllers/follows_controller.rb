# frozen_string_literal: true

class FollowsController < ApplicationController
  before_action :authenticate_user!
  def create
    @follow = Follow.create(follower_id: current_user.id, followed_id: follow_params[:followed_id])
    if @follow
      redirect_to posts_path, flash: { success: 'You are now following that User' }
    else
      render posts_path, flash: { danger: @follow.errors }
    end
  end

  def destroy
    @unfollow = Follow.find_by(follower_id: current_user.id, followed_id: follow_params[:followed_id])
    if @unfollow.destroy
      redirect_to posts_path, flash: { info: 'Unfollowing that User' }
    else
      render posts_path, flash: { danger: @unfollow.errors }
    end
  end

  private

  def follow_params
    params.require(:follow).permit(:followed_id)
  end
end
