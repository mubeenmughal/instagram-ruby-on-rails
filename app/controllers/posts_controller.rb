# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token
  # before_action :check_permission, only: [:destroy]

  def index
    @comments = Comment.new
    # following_ids = Follow.where(follower_id: current_user.id).pluck(:followed_id) << current_user.id
    following_ids = Follow.find_following_ids(current_user.id)
    @follower_suggestions = User.where.not(id: following_ids)
    # @follower_suggestions = User.all
    @posts = Post.where(user_id: following_ids)

  end

  def new
    @post = current_user.posts.new
    @comment = Comment.new
  end

  def edit
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
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy
    redirect_to posts_path, flash: {success: "post was deleted successfully"}
  end

  def follow_user
    user_id = params[:follow_id]
    if Follow.create(follower_id: current_user.id,followed_id: user_id)

    @followee = true
    flash[:success] = "following user"
    else
      flash[:danger] = "unable to following user"
    end
    redirect_to posts_path
  end

  def unfollow_user
    @unfollow = Follow.find_by(follower_id: current_user.id,followed_id: params[:id])
    if @unfollow.destroy
      @followee = false
      flash[:success] = "unfollowing user"
    end
    redirect_to posts_path
  end

  private

  def post_params

    params.require(:post).permit(:description, :post_id,:like_id,:comment_id,:images).tap do |permitted_params|
    permitted_params[:user_id] = current_user.id
    end
  end

end
