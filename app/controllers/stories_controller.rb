class StoriesController < ApplicationController

  before_action :get_story, only: [:destroy]

  def index
    @stories= Story.all
  end

  def create
    @story = Story.new(post_params)
    @story.user = current_user
    # @story = current_user.story.build(post_params) #its not working. we get nill in the story
    if @story.save!
      redirect_to posts_path, flash: {success: "story was created successfully"}
    else
      render @story, flash: {danger: @story.errors }
    end
  end

  def new
    @story = Story.new
    @story.user = current_user
    # @story = current_user.story.new
  end

  def show
  end

  def destroy
    if @story.destroy
      redirect_to posts_path, flash: {success: "story was deleted successfully"}
    else
      redirect_to posts_path, flash: {danger: @story.errors }
    end

  end

  private

  def post_params
    params.require(:story).permit(:description, :images )
  end

  def get_story
    @story = Story.find(params[:id])
  end
end
