class AddIconColumnToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :icon, :string, default: 'ion-scissors'
  end
end
