class CreateAvailability < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.date :date
      t.integer :resource_id
      t.timestamps
    end
  end
end
