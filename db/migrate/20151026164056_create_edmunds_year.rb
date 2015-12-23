class CreateEdmundsYear < ActiveRecord::Migration
  def change
    create_table :edmunds_years do |t|
      t.integer :year
      t.references :edmunds_model

      t.timestamps
    end
  end
end
