# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :check_story, only: [:destroy]
  before_action :check_permission, only: %i[destroy show]

  def create
    @story = Story.new(post_params)
    @story.user = current_user
    authorize @story
    if @story.save
      redirect_to posts_path, flash: { success: 'story was created successfully' }
    else
      render posts_path, flash: { danger: @story.errors }
    end
  end

  def new
    @story = Story.new
    @story.user = current_user
  end

  def show; end

  def destroy
    if @story.destroy
      redirect_to posts_path, flash: { success: 'story was deleted successfully' }
    else
      render posts_path, flash: { danger: @story.errors }
    end
  end

  private

  def post_params
    params.require(:story).permit(:description, :images)
  end

  def check_story
    @story = Story.find(params[:id])
  end

  def check_permission
    authorize @story
  end
end
