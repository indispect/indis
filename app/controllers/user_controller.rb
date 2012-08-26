class UserController < ApplicationController
   before_filter :authenticate_user!, :only => [:index, :show]
  def index
    @users = User.all
  end

  def show
    @user = current_user
    render "users/account/index"
  end
  
  def login
    
    @users = User.where("app_id = ? AND secret = ?",params[:appId],params[:secret]).all
    
    @user = @users.first
    
    if @user
      
      cookies[:user] = @user.email  
      session[:indi_token] = SecureRandom.hex(10)
      render :json => session[:indi_token]
    end
  end
  
end