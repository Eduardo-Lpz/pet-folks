class User < ApplicationRecord
  include AccountDetailConcern

  has_one :adoption_preference

  has_secure_password

  validates :name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
end
