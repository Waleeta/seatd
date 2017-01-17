class AppointmentMailer < ApplicationMailer
  def confirm_email(email, appointment)
    mail(to: email, subject: 'Someone has booked an appointment!')
  end
end
