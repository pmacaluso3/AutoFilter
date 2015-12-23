class CreateCraigslistRawCar < ActiveRecord::Migration
  def change
    create_table :craigslist_raw_cars do |t|
      t.string :ymm_field
      t.string :zip

      t.timestamps
    end
  end
end
