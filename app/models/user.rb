class User < ApplicationRecord
  devise :database_authenticatable,
    :registerable,
    :recoverable,
    :rememberable,
    :validatable

  has_one :adoption_preference

  validates :name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :address, length: {maximum: 80}
  validates :lonlat, presence: true, uniqueness: true
  validates :phone, presence: true, length: {minimun: 10, maximum: 13}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {case_sensitive: false}, unless: proc { |c| c.email.blank? }
end
