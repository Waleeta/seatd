require "rails_helper"

RSpec.describe Appointment, :type => :model do

  User.delete_all
  client = User.create!(name: "sam", email: "sam@gmail.com", password: "password")
  service = Service.create!(service_type: "hair", category_id: 1, employee_id: 1, business_id: 1)
  employee = Employee.create!(name: "Waleeta", description: "Tattoo artist", photo: "www.google.com", business_id: 1)
  appointment = Appointment.create!(booked: true, start_time: "2017-01-13 22:57:38", end_time: "2017-04-23 22:57:38", client_id: client.id, service_id: service.id, employee_id: employee.id)

  it "has a boolean value to tell whether or not it is booked" do
    expect(appointment.booked).to eq(true)
  end

  it "defaults to booked: false if no value is given" do
    apt = Appointment.create!(start_time: "2017-01-13 22:57:38", end_time: "2017-04-23 22:57:38", client_id: client.id, service_id: service.id, employee_id: 1)

    expect(apt.booked).to eq(false)
  end

  it "has a start time" do
    expect(appointment.start_time).to eq("2017-01-13 22:57:38")
  end

  it "has an end time" do
    expect(appointment.end_time).to eq("2017-04-23 22:57:38")
  end

  it "belongs to a User object" do
    expect(appointment.client).to eq(client)
  end

  it "belongs to a Service object" do
    expect(appointment.service).to eq(service)
  end

  it "belongs to an Employee object" do
    expect(appointment.employee).to eq(employee)
  end
end





