class LikesController < ApplicationController
  def like
    like=Like.find_by(user_id:@current_user.id,post_id:params[:post_id])
    if like.present?
      like.destroy
      redirect_to show_profile_path(token:@token,user:params[:user_id],post_id:params[:post_id])
    else
      Like.create(user_id:@current_user.id,post_id:params[:post_id])
      redirect_to show_profile_path(token:@token,user:params[:user_id],post_id:params[:post_id])
    end
  end


end
