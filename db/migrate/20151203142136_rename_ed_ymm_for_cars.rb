class RenameEdYmmForCars < ActiveRecord::Migration
  def change
    remove_column :cars, :ed_make_id 
    remove_column :cars, :ed_model_id 
    remove_column :cars, :ed_year_id 

    add_column :cars, :edmunds_make_id, :integer
    add_column :cars, :edmunds_model_id, :integer
    add_column :cars, :edmunds_year_id, :integer
  end
end
