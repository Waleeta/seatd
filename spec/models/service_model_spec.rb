require "rails_helper"

RSpec.describe User, :type => :model do
  User.delete_all
  Business.delete_all
  client = User.create!(name: "sam", email: "sam@gmail.com", password: "password")
  business = Business.create!(business_name: "Sally's Salon", password: "password", email: "sally@sallys.com", address: "1234 Michigan Ave.", open_at: Time.now, close_at: Time.now, lat: "12.4124", long: "13.1355" )
  employee = Employee.create!(name: "Waleeta", description: "Tattoo artist", photo: "www.google.com", business_id: 1)
  appointment = Appointment.create!(booked: true, start_time: "2017-01-13 22:57:38", end_time: "2017-04-23 22:57:38", client_id: client.id, service_id: 1, employee_id: 1)
  category = Category.create!(category_type: "salon")
  service = Service.create!(service_type: "hair", category_id: category.id, employee_id: employee.id, business_id: business.id)

  it "has a service type" do
    expect(service.service_type).to eq("hair")
  end

  it "belongs to a Category object" do
    expect(service.category).to eq(category)
  end

  it "belongs to an Employee object" do
    expect(service.employee).to eq(employee)
  end

  it "belongs to a Business object" do
    expect(service.business).to eq(business)
  end
end
