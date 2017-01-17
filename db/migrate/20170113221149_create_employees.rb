class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :photo, null: false, default: "https://s-media-cache-ak0.pinimg.com/736x/48/14/d7/4814d77525b02730db6817b135cf3d5f.jpg"
      t.integer :business_id, null: false

      t.timestamps null: false
    end
  end
end
