json.appointments @appointments do |appt|
  json.(appt, :date, :business_name, :employee_name)
end
