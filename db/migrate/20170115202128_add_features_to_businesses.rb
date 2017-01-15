class AddFeaturesToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :phone, :string
    add_column :businesses, :website, :string
  end
end
