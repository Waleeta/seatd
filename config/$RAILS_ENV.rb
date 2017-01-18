

config.action_mailer.perform_deliveries = true
config.action_mailer.raise_delivery_errors = true
config.action_mailer.default_options = {from: 'seatd.booked@gmail.com'}

config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address:              'smtp.gmail.com',
  port:                 587,
  domain:               'gmail.com',
  user_name:            'seatd.booked@gmail.com',
  password:             'seatd1234',
  authentication:       'plain',
  enable_starttls_auto: true  }

