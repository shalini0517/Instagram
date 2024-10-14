class LoginsController < ApplicationController
    skip_before_action:expiration
    include JwtToken

    def new
        @user = User.new
    end

    def create
      @user = User.find_by_username(params[:username])
      if @user.nil?
        flash.alert = "User not found!!"
        render :new and return
      elsif @user.password == params[:password]
        @token = JwtToken.jwt_encode(@user.id)
        @user.logged =true
        @user.save(validate:false)
        redirect_to profile_path(token: @token,logged:@user.logged)
      else
        flash.alert = "password wrong!!"
        render :new
      end
    end

    def logout
      @user=User.find(params[:user])
      @user.logged =false
      @user.save(validate:false)
      redirect_to login_path and return
    end



end

