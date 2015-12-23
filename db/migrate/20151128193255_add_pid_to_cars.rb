class AddPidToCars < ActiveRecord::Migration
  def change
    add_column :cars, :cl_pid, :string
  end
end
