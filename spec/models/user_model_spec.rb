require "rails_helper"

RSpec.describe User, :type => :model do
  User.delete_all
  user = User.create!(name: "Justin", email: "justin@gmail.com", password: "password")

  it "has a name" do
    expect(user.name).to eq("Justin")
  end

  it "has an email" do
    expect(user.email).to eq("justin@gmail.com")
  end

  it "has a password" do
    expect(user.password).to eq("password")
  end

  it "has many appointments" do
    appointment = Appointment.create!(booked: true, start_time: "2017-01-13 22:57:38", end_time: "2017-04-23 22:57:38", client_id: user.id, service_id: 1, employee_id: 1)

    expect(user.appointments).to eq([appointment])
  end
end
