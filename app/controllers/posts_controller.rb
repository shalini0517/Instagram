class PostsController < ApplicationController

  def all_posts
    @user=User.find_by_id(params[:user])
    @post=@user.posts
  end

  def new
    @post=Post.new
  end

  def create
    user_id = @current_user.id
    @post = Post.new(post_params)
    @post.user_id=user_id
    if @post.save
      redirect_to profile_path(token:@token)
    else
      render :new
    end
  end

  private
    def post_params
      params.permit(:user_id,:post_feed,:Description)
    end

end
