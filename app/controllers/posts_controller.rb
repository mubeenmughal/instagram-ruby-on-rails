# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  before_action :get_post, only: [:destroy]

  def index
    @comment = Comment.new
    following_ids = Follow.find_following_ids(current_user.id)
    @follower_suggestions = User.where.not(id: current_user.id)
    @posts = Post.where(user_id: following_ids)
  end

  def new
    @post = current_user.posts.new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save!
      redirect_to @post, flash: {success: "post was created successfully"}
    else
      redirect_to new_post_path, flash: {danger: "post was not  created successfully"}
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    authorize @post
    @post.destroy
    redirect_to posts_path, flash: {success: "Post was deleted successfully"}
  end

  def follow_user
    if Follow.create(follower_id: current_user.id,followed_id: params[:follow_id])
        redirect_to posts_path, flash: {success: "You are now following that User"}
    else
      redirect_to posts_path, flash: {danger: "Unable to following"}
    end
  end

  def unfollow_user
    @unfollow = Follow.find_by(follower_id: current_user.id,followed_id: params[:id])
    if @unfollow.destroy
      redirect_to posts_path, flash: {info: "Unfollowing that User"}
    else
      redirect_to posts_path, flash: {danger: @unfollow.errors }
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :post_id,:like_id,:comment_id,:images)
  end

  def get_post
    @post = Post.find(params[:id])
  end
end
