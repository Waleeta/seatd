class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :business_name, null: false
      t.string  :hashed_password, null: false
      t.string  :email, null: false
      t.string :address,null: false
      t.time :open_at, null: false
      t.time :close_at, null: false
      t.string :lat, null: false, default:  '41.8762291'
      t.string :long, null: false, default: '-87.6532040'

      t.timestamps null: false
    end
  end
end

