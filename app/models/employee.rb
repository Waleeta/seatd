class Employee < ActiveRecord::Base
  belongs_to  :business
  has_many  :services
  has_many  :categories, through: :services
  has_many  :appointments
  has_many  :clients, through: :appointments

  validates :name, :description, :photo, :business_id, {presence: true}

  def has_current_appointments?
    appt_is_within_two_days? && has_appointments?
  end

  def appt_is_within_two_days?
    self.appointments.map do |appt|
      Date.parse(appt.to_s) <= 3.days.from_now
    end
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
      if DateTime.parse(a.start_time.to_s) <= 3.days.from_now && a.booked == false
        available_appointments << a
      end
    end
    return available_appointments
  end

  def formatted_available_appointments
      final = {}
      available_appointments.each do |appt|
        final[appt.id] = appt.start_time.strftime("%A, %I:%M")}
      end
      return final
  end

  def sorted_appointments
    self.appointments.sort_by {|appt| DateTime.parse(appt.start_time.to_s).day}
  end

  def group_appointments_by_day
    sorted_appointments
    self.appointments.group_by(&:start_time)
  end

  def appointments
    appointments.each do |a|
      a.start_time = a.strftime("%A, %I:%M")
      a.save
    end
    return appointments
  end


end
