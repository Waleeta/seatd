class Category < ActiveRecord::Base
  has_many  :services
  has_many  :businesses, through: :services
  has_many  :employees, through: :services

  validates :category_type, {presence: true}

end
