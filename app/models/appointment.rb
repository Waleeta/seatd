class Appointment < ActiveRecord::Base
  belongs_to  :client, class_name: :User
  belongs_to  :service
  belongs_to  :employee

  validates :start_time, :end_time, :service_id, :employee_id, {presence: true}

  def date
    self.start_time.strftime("%A %B, %e")
  end

  def business_name
    self.employee.business.business_name
  end

  def employee_name
    self.employee.name
  end
end
