# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_post, only: %i[destroy show]
  before_action :check_permission, only: %i[destroy show]

  def index
    @comment = Comment.new
    following_ids = Follow.find_following_ids(current_user.id)
    @follower_suggestions = User.where.not(id: current_user.id)
    @posts = Post.includes(:comments, :likes).where(user_id: following_ids).order(created_at: :desc)
  end

  def new
    @post = current_user.posts.new
    @comment = Comment.new
  end

  def create
    @post = current_user.posts.new(post_params)
    authorize @post
    if @post.save
      redirect_to post_path(@post.id), flash: { success: 'post was created successfully' }
    else
      render new_post_path, flash: { danger: @post.errors }
    end
  end

  def show; end

  def destroy
    if @post.destroy
      redirect_to posts_path, flash: { success: 'Post was deleted successfully' }
    else
      render new_post_path, flash: { danger: @post.errors }
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :images)
  end

  def check_post
    @post = Post.find(params[:id])
  end

  def check_permission
    authorize @post
  end
end
