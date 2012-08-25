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
    
    puts "In Login"
    user = User.where('app_id = ? AND secret = ?',params[:appId],params[:secret]).limit(1)
    if user
      cookies[:user] = user.email  
      indi_token = session[:indi_token] = SecureRandom.base64(10)
      render :json => indi_token
    end
  end
  
end