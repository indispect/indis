class Query < ActiveRecord::Base
  attr_accessible :age, :edu, :gender, :name, :status, :campaign_id
  
  belongs_to :campaign
end
