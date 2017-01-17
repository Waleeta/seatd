class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.boolean :booked, default: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.integer :client_id
      t.integer :service_id, null: false
      t.integer :employee_id, null: false

      t.timestamps null: false
    end
  end
end

