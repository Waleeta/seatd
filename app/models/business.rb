class Business < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many  :employees
  has_many  :appointments, through: :employees
  has_many  :services
  has_many  :categories, through: :services
  has_many  :clients, through: :employees, source: :appointments

  validates :address, :open_at, :close_at, :lat, :long, :encrypted_password, {presence: true}
  validates :business_name, {presence: true, uniqueness: true}
end
