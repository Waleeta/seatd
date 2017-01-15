require "rails_helper"

RSpec.describe Business, :type => :model do
  User.delete_all
  Business.delete_all
  client = User.create!(name: "sam", email: "sam@gmail.com", password: "password")
  business = Business.create!(business_name: "Sally's Salon", password: "password", email: "sally@sallys.com", address: "1234 Michigan Ave.", open_at: "22:57:38", close_at: "22:57:38", lat: "12.4124", long: "13.1355" )
  employee = Employee.create!(name: "Waleeta", description: "Tattoo artist", photo: "www.google.com", business_id: business.id)
  appointment = Appointment.create!(booked: true, start_time: "2017-01-13 22:57:38", end_time: "2017-04-23 22:57:38", client_id: client.id, service_id: 1, employee_id: employee.id)
  category = Category.create!(category_type: "salon")
  service = Service.create!(service_type: "hair", category_id: category.id, employee_id: employee.id, business_id: business.id)

  it "has an address" do
    expect(business.address).to eq("1234 Michigan Ave.")
  end

  it "has an opening time" do
    expect(business.pretty_open_time).to eq("10:57 pm")
  end

  it "has a closing time" do
    expect(business.pretty_close_time).to eq("10:57 pm")
  end

  it "has a latitude and longitude" do
    expect(business.lat).to eq("12.4124")
    expect(business.long).to eq("13.1355")
  end

  it "has a password" do
    expect(business.password).to eq("password")
  end

  it "has a business name" do
    expect(business.business_name).to eq("Sally's Salon")
  end

  it "has employees" do
    expect(business.employees).to eq([employee])
  end

  it "has appointments" do
    expect(business.appointments).to eq([appointment])
  end

  it "has services" do
    expect(business.services).to eq([service])
  end

  it "has categories" do
    expect(business.categories).to eq([category])
  end

  it "has clients" do
    expect(business.clients).to eq([client])
  end
end
