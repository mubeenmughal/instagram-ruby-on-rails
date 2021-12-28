# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]
  before_action :check_permission, only: %i[destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    @post = @comment.post
    authorize @comment
    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js { render 'create', locals: { error: @comment.errors.full_messages.to_sentence } }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @comment.destroy
        format.js
      else
        format.js { render 'destroy', locals: { error: @comment.errors.full_messages.to_sentence } }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def check_permission
    authorize @comment
  end
end
