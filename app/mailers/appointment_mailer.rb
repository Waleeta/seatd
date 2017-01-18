class AppointmentMailer < ApplicationMailer
  default from: "seats.booked@gmail.com"

  def confirm_email(email)
    # @url = ''
    mail(to: email, subject: 'Someone has been Seatd!!')
  end
end
