class AppointmentSerializer < ActiveModel::Serializer
  attributes :booked, :start_time, :client, :service, :employee
end
