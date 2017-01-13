class Service < ActiveRecord::Base
  belongs_to :category
  belongs_to :employee
  belongs_to :business

  validates :service_type, :category_id, :employee_id, :business_id, {presence: true}
end
