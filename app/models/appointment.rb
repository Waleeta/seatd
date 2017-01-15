class Appointment < ActiveRecord::Base
  belongs_to  :client, class_name: :User
  belongs_to  :service
  belongs_to  :employee

  validates :start_time, :end_time, :service_id, :employee_id, {presence: true}

end
