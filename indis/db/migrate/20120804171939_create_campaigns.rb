class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name
      t.integer :budget
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
