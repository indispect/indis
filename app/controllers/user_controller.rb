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
    
    puts params[:appId].to_s + " <<<<<  "+ params[:secret].to_s + " In Login xxx"
    query = 'app_id = '+params[:appId].to_s+' AND secret = ' + params[:secret].to_s
    puts query + "  <<<<<<<<"
    user = User.where(query)
    if user
      puts user.to_s + "  user <<<<<<<<<<"
      cookies[:user] = user.email  
      indi_token = session[:indi_token] = SecureRandom.base64(10)
      render :json => indi_token
    end
  end
  
end