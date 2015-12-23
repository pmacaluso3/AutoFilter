class AddClFieldsToCraigslistRawCars < ActiveRecord::Migration
  def change
    add_column :craigslist_raw_cars, :condition, :string
    add_column :craigslist_raw_cars, :cylinders, :string
    add_column :craigslist_raw_cars, :drive, :string
    add_column :craigslist_raw_cars, :fuel, :string
    add_column :craigslist_raw_cars, :paint_color, :string
    add_column :craigslist_raw_cars, :size, :string
    add_column :craigslist_raw_cars, :title_status, :string
    add_column :craigslist_raw_cars, :transmission, :string
    add_column :craigslist_raw_cars, :type, :string
  end
end
