class Employee < ActiveRecord::Base
  belongs_to  :business
  has_many  :services
  has_many  :categories, through: :services
  has_many  :appointments
  has_many  :clients, through: :appointments

  validates :name, :description, :photo, :business_id, {presence: true}

  def has_appointments?
    self.appointments.length > 0
  end

  def today_or_after?
    Date.parse(self.appointment.start_time.to_s) >= Date.parse(Date.today.to_s)
  end

end
