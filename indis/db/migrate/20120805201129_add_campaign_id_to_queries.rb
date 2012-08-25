class AddCampaignIdToQueries < ActiveRecord::Migration
  def change
    add_column :queries, :campaign_id, :integer
  end
end
