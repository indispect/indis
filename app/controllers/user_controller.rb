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
    @users = User.all
    
    puts @users.to_s + " users <<<<<<<<"
    
    
    puts params[:appId].to_s + " <<<<<  "+ params[:secret].to_s + " In Login xxx"
    
    
    
    @user = User.find(3)
    
    puts @user.to_s + " xxxxxx yyyyyy" + @user.email + " hhhhh" + @user.app_id
    
    @email = "amit.ashkenazi77@gmail.com"
    
    @user = User.where("email = amit.ashkenazi77@gmail.com")
    
    puts @user.to_s + " xxxxxx eeeeee" + @user.email + " gggg  " + @user.app_id
    
    @user = User.where("app_id = ? AND secret = ?",params[:appId].to_s,params[:secret].to_s)
    if @user
      puts @user.to_s + "  user <<<<<<<<<<"
      cookies[:user] = @user.email  
      indi_token = session[:indi_token] = SecureRandom.base64(10)
      render :json => indi_token
    end
  end
  
end