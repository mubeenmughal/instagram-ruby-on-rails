# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @like = Like.new(post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      if @like.save
        format.js { render 'create', locals: { post: @like.post } }
      else
        format.js { render 'create', locals: { error: @like.errors.full_messages.to_sentence } }
      end
    end
  end

  def destroy
    @unlike = Like.find_by(post_id: params[:id])
    respond_to do |format|
      if @unlike.destroy
        format.js { render 'destroy', locals: { post: @unlike.post } }
      else
        format.js { render 'destroy', locals: { error: @unlike.errors.full_messages.to_sentence } }
      end
    end
  end
end
