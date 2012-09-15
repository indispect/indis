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
      
      cookies[:user_id] = @user.id  
      @indi_token = session[:indi_token] = SecureRandom.hex(10)
      respond_to do |format|
        format.json { render :json => {:indi_token => @indi_token }}
      end
      
    end
  end
  
end