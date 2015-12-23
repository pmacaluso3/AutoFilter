class CreateEdmundsModel < ActiveRecord::Migration
  def change
    create_table :edmunds_models do |t|
      t.string :name
      t.string :nice_name
      t.references :edmunds_make

      t.timestamps
    end
  end
end
