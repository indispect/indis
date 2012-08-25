class CreateQueries < ActiveRecord::Migration
  def change
    create_table :queries do |t|
      t.decimal :age
      t.string :edu
      t.string :gender
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
