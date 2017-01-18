class AppointmentMailer < ApplicationMailer
  default from: "seatd.booked@gmail.com"

  def confirm_email(email)
    @url = 'http://localhost:3000/employees/:id/appointments'
    mail(to: email, subject: 'Someone has booked an appointment!')
  end
end
