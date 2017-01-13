json.extract! business, :id, :business_name, :address, :open_at, :close_at, :lat, :long, :created_at, :updated_at
json.url business_url(business, format: :json)