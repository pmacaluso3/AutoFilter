class CreateEdmundsMake < ActiveRecord::Migration
  def change
    create_table :edmunds_makes do |t|
      t.string :name
      t.string :nice_name

      t.timestamps
    end
  end
end
