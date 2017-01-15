class Business < ActiveRecord::Base
  include BCrypt
  has_many  :employees
  has_many  :appointments, through: :employees
  has_many  :services
  has_many  :categories, through: :services
  has_many  :clients, through: :appointments

  validates :address, :open_at, :close_at, :lat, :long, :hashed_password, {presence: true}
  validates :business_name, {presence: true, uniqueness: true}

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = Password.create(@raw_password)
    self.hashed_password = @password
  end

  def password_errors
    if @raw_password.length < 5
      errors.add(:password, "Password must be at least 5 characters")
    end
   end

  def authenticate(password)
    self.password == password
  end

  def pretty_open_time
    self.open_at.strftime("%l:%M %P")
  end

  def pretty_close_time
    self.close_at.strftime("%l:%M %P")
  end
end
