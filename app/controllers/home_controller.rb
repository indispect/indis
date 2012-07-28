class HomeController < ApplicationController
  
  def index
  end
  
  def set_fb_user
    session[:access_token] = params[:token]
    @api = Koala::Facebook::API.new(session[:access_token])
    
    # http://graph.facebook.com/me
    @graph_data = @api.get_object("me")
    
    puts @graph_data + "<< graph"
  end
  
  
end
