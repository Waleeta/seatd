class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.string :photo, null: false, default: "http://www.billboard.com/files/styles/article_main_image/public/media/cher-press-2014-650-430.jpg"
      t.integer :business_id, null: false

      t.timestamps null: false
    end
  end
end
