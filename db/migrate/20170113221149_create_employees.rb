class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :photo, null: false
      t.integer :business_id, null: false

      t.timestamps null: false
    end
  end
end
