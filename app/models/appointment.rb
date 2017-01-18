class Appointment < ActiveRecord::Base
  belongs_to  :client, class_name: :User
  belongs_to  :service
  belongs_to  :employee

  validates :start_time, :end_time, :service_id, :employee_id, {presence: true}

  def date
    self.start_time.strftime("%A %B, %e")
  end

  def business_object
    self.employee.business
  end

  def business_name
    self.employee.business.business_name
  end

  def employee_name
    self.employee.name
  end

  def within_two_days?
    Date.parse(self.start_time.to_s) <= 3.days.from_now && self.start_time >= Date.yesterday
  end

end
