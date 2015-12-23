class AddEdmundsFieldsToCraigslistProcessedCars < ActiveRecord::Migration
  def change
    add_column :craigslist_processed_cars, :condition, :string
    add_column :craigslist_processed_cars, :cylinders, :string
    add_column :craigslist_processed_cars, :drive, :string
    add_column :craigslist_processed_cars, :fuel, :string
    add_column :craigslist_processed_cars, :paint_color, :string
    add_column :craigslist_processed_cars, :size, :string
    add_column :craigslist_processed_cars, :title_status, :string
    add_column :craigslist_processed_cars, :transmission, :string
    add_column :craigslist_processed_cars, :type, :string
  end
end
