class LikesController < ApplicationController
    def create
        like = current_user.likes.create(ball_id: params[:ball_id]) #user_idとball_idの二つを代入
        redirect_back(fallback_location: new_ball_path)
      end
    
      def destroy
        like = Like.find_by(ball_id: params[:ball_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: new_ball_path)
      end
end
