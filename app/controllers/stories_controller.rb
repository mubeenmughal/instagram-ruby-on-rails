# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :get_story, only: [:destroy]
  before_action :check_permission, only: %i[destory show]
  include StoriesHelper

  def create
    @story = Story.new(post_params)
    @story.user = current_user
    authorize @story
    save_helper(@story)
  end

  def new
    @story = Story.new
    @story.user = current_user
  end

  def show; end

  def destroy
    destroy_helper(@story)
  end

  private

  def post_params
    params.require(:story).permit(:description, :images)
  end

  def get_story
    @story = Story.find(params[:id])
  end

  def check_permission
    authorize @story
  end
end
