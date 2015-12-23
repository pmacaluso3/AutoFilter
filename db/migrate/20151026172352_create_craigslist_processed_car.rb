class CreateCraigslistProcessedCar < ActiveRecord::Migration
  def change
    create_table :craigslist_processed_cars do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.string :zip

      t.timestamps
    end
  end
end
