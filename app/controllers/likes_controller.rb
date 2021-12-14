class LikesController < ApplicationController
  before_action :authenticate_user!

  def save_like
      @like = Like.new(post_id: params[:post_id],user_id: current_user.id)
      @post_id = params[:post_id]
      # byebug
      existing_like = Like.where(post_id: params[:post_id],user_id: current_user.id)
      if @like.save!
        redirect_to post_path, notice: "Like successfully"
      end

    end
end
