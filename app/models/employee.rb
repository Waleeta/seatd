class Employee < ActiveRecord::Base
  belongs_to  :business
  has_many  :services
  has_many  :categories, through: :services
  has_many  :appointments
  has_many  :clients, through: :appointments

  validates :name, :description, :photo, :business_id, {presence: true}

  def has_current_appointments?
    if has_appointments?
      self.appointments.each do |appt|
        DateTime.parse(appt.start_time.to_s) <= 2.days.from_now
      end
    end
  end

  def appt_is_within_two_days?
    DateTime.parse(self.start_time.to_s) <= 2.days.from_now
  end

  def has_appointments?
      self.appointments.length > 0
  end

  def today_or_after?
    Date.parse(self.appointment.start_time.to_s) >= Date.parse(Date.today.to_s)
  end

  def available_appointments
    available_appointments = []
    self.appointments.each do |a|
      if DateTime.parse(a.start_time.to_s) <= 2.days.from_now && a.booked == false
        available_appointments << a
      end
    end
    return available_appointments
  end

  def sorted_appointments
    self.appointments.sort_by {|appt| DateTime.parse(appt.start_time.to_s).day}
  end


end
