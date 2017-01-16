class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :service_type, null: false
      t.integer :category_id, null: false
      t.integer :employee_id, null: false
      t.integer :business_id, null: false, default: 1

      t.timestamps null: false
    end
  end
end


