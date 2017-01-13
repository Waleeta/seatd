class Employee < ActiveRecord::Base
  belongs_to  :business
  has_many  :services
  has_many  :categories, through: :services
  has_many  :appointments
  has_many  :clients, through: :appointments

  validates :name, :description, :photo, :business_id, {presence: true}

end
