class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_name, null: false
      t.string  :hashed_password, null: false
      t.string  :email, null: false
      t.string :address,null: false
      t.datetime :open_at, null: false
      t.datetime :close_at, null: false
      t.string :lat, null: false
      t.string :long, null: false

      t.timestamps null: false
    end
  end
end
