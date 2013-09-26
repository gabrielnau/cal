class AddIndexes < ActiveRecord::Migration
  def change
    add_index :availabilities, [:date, :resource_id], unique: true
  end
end
