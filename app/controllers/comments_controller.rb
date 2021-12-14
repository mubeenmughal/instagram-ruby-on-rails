class CommentsController < ApplicationController

  def index
    @comments =Comment.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if user_signed_in?
    if @comment.save!
      redirect_to posts_path, flash: {success: "comment was created successfully"}

    else
      redirect_to posts_path, flash: {danger: "comment was not saved"}
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:description,:post_id)
  end
end
