
class Campaign < ActiveRecord::Base
  attr_accessible :budget, :end, :name, :start
  
  has_many :queries, :dependent => :destroy
  
  belongs_to :user
end
