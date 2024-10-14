class UsersController < ApplicationController
  skip_before_action :expiration
  def index
    @users=User.all
    render :index
  end

  def new
    @user=User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
      flash.alert = "Registered Successfully!!"
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user=User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    render json: { message: "Destroyed Successfully!"}
  end

  private
    def user_params
      params.require(:user).permit(:name,:email,:phone_number,:username,:password,:password_confirmation,:account_type,:profile_picture)
    end

end
