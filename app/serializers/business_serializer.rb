class BusinessSerializer < ActiveModel::Serializer
  attributes :id, :business_name, :hashed_password, :email, :address, :open_at, :close_at, :lat, :long
end
