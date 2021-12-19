class StoriesController < ApplicationController

  def index
    @stories= Story.all
  end
  def create
    @story = Story.new(post_params)
    @story.user = current_user
    if @story.save!
      RemoveStoryJob.set(wait: 1.minutes).perform_later(@story)
      render 'show' ,flash: {success: "story  was created successfully"}
    else
      redirect_to  stories_create_path, flash: {danger: "story was not created successfully"}
    end
  end

  def new
    @story = Story.new
    @story.user = current_user
  end

  def show
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to posts_path, flash: {success: "comment was deleted successfully"}
  end

  private

  def post_params
    params.require(:story).permit(:description, :user_id, :images )
  end
end
