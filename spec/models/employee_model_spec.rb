require "rails_helper"

RSpec.describe Employee, :type => :model do

  User.delete_all
  Business.delete_all
  client = User.create!(name: "sam", email: "sam@gmail.com", password: "password")
  business = Business.create!(business_name: "Sally's Salon", password: "password", email: "sally@sallys.com", address: "1234 Michigan Ave.", open_at: "22:57:38", close_at: "22:57:38", lat: "12.4124", long: "13.1355" )
  employee = Employee.create!(name: "Waleeta", description: "Tattoo artist", photo: "www.google.com", business_id: business.id)
  appointment = Appointment.create!(booked: true, start_time: "2017-01-13 22:57:38", end_time: "2017-04-23 22:57:38", client_id: client.id, service_id: 1, employee_id: employee.id)
  category = Category.create!(category_type: "salon")
  service = Service.create!(service_type: "hair", category_id: category.id, employee_id: employee.id, business_id: business.id)

  it "has a name" do
    expect(employee.name).to eq("Waleeta")
  end

  it "has a description" do
    expect(employee.description).to eq("Tattoo artist")
  end

  it "has a photo url" do
    expect(employee.photo).to eq("www.google.com")
  end

  it "belongs to a Business object" do
    expect(employee.business).to eq(business)
  end

  it "has services" do
    expect(employee.services).to eq([service])
  end

  it "has categories" do
    expect(employee.categories).to eq([category])
  end

  it "has appointments" do
    expect(employee.appointments).to eq([appointment])
  end

  it "has clients" do
    expect(employee.clients).to eq([client])
  end
end

