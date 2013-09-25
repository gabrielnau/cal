class CreateModels < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.integer :user_id
      t.string  :name
      t.timestamps
    end

    create_table :users do |t|
      t.string :email
      t.timestamps
    end
  end
end
