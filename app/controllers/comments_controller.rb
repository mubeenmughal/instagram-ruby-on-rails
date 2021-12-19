class CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :find_comment, only: [:destroy]

  def index
    @comments =Comment.all
  end

  def create
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id if user_signed_in?
    @comment=current_user.comments.build(comment_params)
    if @comment.save!
      redirect_to posts_path, flash: {success: "comment was created successfully"}

    else
      redirect_to posts_path, flash: {danger: "comment was not saved"}
    end
  end

  def destroy
    authorize @comment
    @comment.destroy
    redirect_to posts_path, flash: {success: "comment was deleted successfully"}
  end

  private
  def comment_params
    params.require(:comment).permit(:description,:post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
