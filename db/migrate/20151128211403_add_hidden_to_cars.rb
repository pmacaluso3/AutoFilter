class AddHiddenToCars < ActiveRecord::Migration
  def change
    add_column :cars, :hidden, :boolean, default: false
  end
end
