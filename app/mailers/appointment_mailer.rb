class AppointmentMailer < ApplicationMailer
  default from: "seats.booked@gmail.com"

  def confirm_email(email, appointment, employee)
    @employee = employee
    @appointment = appointment
    mail(to: email, subject: 'Someone has been Seatd!!') do |format|
    format.html {
    render locals: { appointment: @appointment.start_time, employee: @employee.name, date: @appointment.date }
  }
    end
  end
end
