class AddPricesToCars < ActiveRecord::Migration
  def change
    add_column :cars, :cl_price, :integer
    add_column :cars, :ed_price, :integer
  end
end
