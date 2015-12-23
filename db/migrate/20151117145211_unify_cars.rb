class UnifyCars < ActiveRecord::Migration
  def change
    drop_table :craigslist_raw_cars
    drop_table :craigslist_processed_cars

    create_table :cars do |t|
      t.string :title_text
      t.string :href
      t.string :zip
      t.string :cl_ymm
      t.references :ed_make
      t.references :ed_model
      t.references :ed_year

      t.string :cl_condition
      t.string :cl_cylinders
      t.string :cl_drive
      t.string :cl_fuel
      t.string :cl_paint_color
      t.string :cl_size
      t.string :cl_title_status
      t.string :cl_transmission
      t.string :cl_type

      t.string :ed_condition
      t.string :ed_cylinders
      t.string :ed_drive
      t.string :ed_fuel
      t.string :ed_paint_color
      t.string :ed_size
      t.string :ed_title_status
      t.string :ed_transmission
      t.string :ed_type
    end
  end
end
