class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_comment, only: [:destroy]

  def index
    @comments =Comment.all
  end

  def create
    @comment=current_user.comments.build(comment_params)
    authorize @comment
    @post = @comment.post

    if @comment.save!
      respond_to do |format|
        format.js
      end
    else
      redirect_to posts_path, flash: {danger: @comment.errors }
    end
  end

  def destroy
    authorize @comment
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    else
      redirect_to posts_path, flash: {danger: @comment.errors.messages}#, notice: @comment.errors
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:description,:post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
