class Business < ActiveRecord::Base
  has_many  :employees
  has_many  :appointments, through: :employees
  has_many  :services
  has_many  :categories, through: :services
  has_many  :clients, through: :employees, source: :appointments

  validates :address, :open_at, :close_at, :lat, :long, {presence: true}
  validates :business_name, {presence: true, uniqueness: true}
end
