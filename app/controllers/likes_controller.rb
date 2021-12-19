class LikesController < ApplicationController
  before_action :authenticate_user!

  def save_like
      @post_id = params[:post_id]
      @like = Like.new(post_id: @post_id,user_id: current_user.id)
      existing_like = Like.find_ids(@post_id,current_user.id) # scope
      # existing_like = Like.where(post_id: params[:post_id],user_id: current_user.id)

      respond_to do |format|
        format.js{
          if existing_like.any?

            existing_like.first.destroy
            @success = false
          elsif @like.save!
             success= true
          else
             success=false
          end
            @post_likes = Post.find(@post_id).total_likes_count
            render "posts/like"
        }
      end

      def post_params
        params.require(:post).permit(:post_id)
      end
      # if @like.save!
      #   redirect_to post_path, notice: "Like successfully"
      # end

  end
end
