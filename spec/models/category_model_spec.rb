require "rails_helper"

RSpec.describe Category, :type => :model do

  Business.delete_all
  business = Business.create!(business_name: "Sally's Salon", password: "password", email: "sally@sallys.com", address: "1234 Michigan Ave.", open_at: "22:57:38", close_at: "22:57:38", lat: "12.4124", long: "13.1355" )
  employee = Employee.create!(name: "Waleeta", description: "Tattoo artist", photo: "www.google.com", business_id: business.id)
  category = Category.create!(category_type: "salon")
  service = Service.create!(service_type: "hair", category_id: category.id, employee_id: employee.id, business_id: business.id)

  it "has a category type" do
    expect(category.category_type).to eq("salon")
  end

  it "has services" do
    expect(category.services).to eq([service])
  end

  it "has businesses" do
    expect(category.businesses).to eq([business])
  end

  it "has employees" do
    expect(category.employees).to eq([employee])
  end
end
