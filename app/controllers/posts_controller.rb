# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.new
    @posts = Post.all
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
      redirect_to @post, flash: {success: "Post was created successfully"}

    else
      redirect_to new_post_path, flash: {success: "Post was not saved"}
    end
  end

  def show
    @post = Post.find(params[:id])
    p @post
  end

  private

  def post_params
    params.require(:post).permit!
      # permitted_params[:user_id] = current_user.id
    end
  # end

end
