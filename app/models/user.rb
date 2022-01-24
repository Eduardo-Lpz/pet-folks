class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable

  include AccountDetailConcern

  has_one :adoption_preference

  validates :name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
end
