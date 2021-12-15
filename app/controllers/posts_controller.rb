# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @comments = Comment.new

    following_ids = Follow.where(follower_id: current_user.id).map(&:followed_id) << current_user.id
    @posts = Post.where(user_id: following_ids)

    @follower_suggestions = User.where.not(id: following_ids)
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
      redirect_to @post, :notice => "your post has been saved"

    else
      redirect_to new_post_path, :notice => "your post has not been saved"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "your post has been deleted"
  end

  def follow_user
    user_id = params[:follow_id]
    if Follow.create(follower_id: current_user.id,followed_id: user_id)
      flash[:success] = "following user"
    else
      flash[:danger] = "unable to following user"
    end
  end

  private

  def post_params

    params.require(:post).permit(:description, :post_id,:like_id,:comment_id,:images).tap do |permitted_params|
    permitted_params[:user_id] = current_user.id
    end
  end

end
