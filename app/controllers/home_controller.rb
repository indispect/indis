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
  
  def get_campaign
    @api = Koala::Facebook::API.new(session[:access_token])
    @graph_data = @api.get_object("me")
    @parsed_graph_data = ActiveSupport::JSON.decode(@graph_data)
    @age = @parsed_graph_data['birthday']
    puts @age.to_s + " <<<<<<<<<<<<<"
    @campaign_id = Campaign.find(cookies[:user]).id
    puts @campaign_id.to_s + " <<<<<<<<<<<"
    @queries = Query.where('campaign_id = ?',@campaign_id)
    @queries.each do |query|
      
    end
  end
end
