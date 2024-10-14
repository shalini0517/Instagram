class RelationshipsController < ApplicationController
  def follower
    @followers= @current_user.followers
  end

  def following
    @followees=@current_user.followees
  end

  def search
  end

  def follow
    @user=User.find_by_id(params[:user])
    all_id=@current_user.followees.ids
    if all_id.include?(@user.id)
      redirect_to searches_user_path(token:@token)
    else
      Relationship.create(follower_id:@current_user.id,followee_id:@user.id)
      redirect_to searches_user_path(token: @token)
    end
  end

  def unfollow
    @followee=params[:user]
    Relationship.delete_by(follower_id:@current_user.id,followee_id:@followee)
    redirect_to searches_user_path(token: @token)
  end

  def show_profile
    @user=User.find_by_id(params[:user])
    @posts=@user.posts
    @post_id=@user.posts.ids
    @followers=@user.followers
    @followees=@user.followees
  end

  def user_followers
    @user=User.find(params[:user])
    @followers=@user.followers
  end


  def user_following
    @user=User.find(params[:user])
    @followees=@user.followees
  end

end


