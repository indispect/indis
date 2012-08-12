class UserController < ApplicationController
   before_filter :authenticate_user!
  def index
    
    @users = User.all
    
  end

  def show
    @user = User.find(params[:id])
  end
  
  # POST
  def new
    puts "New User"
    @user.app_id = SecureRandom.random_number(10)
    @user.secret = SecureRandom.base64(32)
  end
end