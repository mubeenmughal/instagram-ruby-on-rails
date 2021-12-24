# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_post, only: %i[destroy show]
  before_action :check_permission, only: %i[destory show]
  include PostsHelper

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
    save_helper(@post)
  end

  def show;  end

  def destroy
    destroy_helper(@post)
  end

  private

  def post_params
    params.require(:post).permit(:description, :images)
  end

  def get_post
    @post = Post.find(params[:id])
  end

  def check_permission
    authorize @post
  end
end
