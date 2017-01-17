class User < ActiveRecord::Base
  include BCrypt

  has_many  :appointments, foreign_key: :client_id

  validates :email, {presence: true, uniqueness: true}
  validates :name, :hashed_password, {presence: true}

# Add Associations Here

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

  def fetch_auth_token!
    self.auth_token = SecureRandom.base64(50)
    self.save!
    self.auth_token
  end
end
