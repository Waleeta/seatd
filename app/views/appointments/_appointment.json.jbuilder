json.extract! appointment, :id, :start_time, :end_time, :client_id, :service_id, :employee_id, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
