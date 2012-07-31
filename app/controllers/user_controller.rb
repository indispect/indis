class UserController < ApplicationController
   before_filter :authenticate_user!
  def index
    puts "<<< in index !!!!!!!"
    @users = User.all
    #render 'login'
  end

  def show
    @user = User.find(params[:id])
  end
end