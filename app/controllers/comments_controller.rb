# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]

  def create
    @comment = current_user.comments.build(comment_params)
    authorize @comment
    @post = @comment.post
    
    if @comment.save!
      respond_to do |format|
        format.js
      end
    else
      format.js { render 'create', locals: { error: @comment.errors.full_messages.to_sentence } }
    end
  end

  def destroy
    authorize @comment
    if @comment.destroy
      respond_to do |format|
        format.js
      end
    else
      format.js { render 'destroy', locals: { error: @comment.errors.full_messages.to_sentence } }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end
end
