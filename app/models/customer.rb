class Customer < ApplicationRecord
  include AccountDetailConcern

  belongs_to :shelter

  has_secure_password

  validates :name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
end
