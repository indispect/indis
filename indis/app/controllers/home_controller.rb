class HomeController < ApplicationController
  
  def index
    
  end
  
  def set_fb_user
    puts params[:indiToken].to_s + "<<<<" + session[:indi_token]
    if ( session[:indi_token] == params[:indiToken] )
      session[:access_token] = params[:fbToken]
      @api = Koala::Facebook::API.new(session[:access_token])
      
      # http://graph.facebook.com/me
      @graph_data = @api.get_object("me")
      
      puts @graph_data.to_s + "<< graph"
      
      render :nothing => true
    end
  end
  
  
end
