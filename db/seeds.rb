# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create(email: "user@user.com", name: "Sally Ride", password: "password")

salon = Business.create(business_name: "Sally Hansen", address: "1234 Michigan Ave.", open_at: DateTime.now, close_at: DateTime.now + 400, lat: '123.423', long: '123.5234')

appt = Appointment.create(booked: true, start_time: DateTime.now, end_time: DateTime.now + 100, client_id: 1, service_id: 1, employee_id: 1)

cat = Category.create(category_type: "hair salon")

employee = Employee.create(name: "Duke", description: "Dope hairdresser", photo: "https://0.gravatar.com/avatar/6aedd7cf05e69e3af3c91b002a2b87bb?s=256&d=identicon&r=G", business_id: 1)

service = Service.create(service_type: "hair cut", category_id: 1, employee_id: 1, business_id: 1)


