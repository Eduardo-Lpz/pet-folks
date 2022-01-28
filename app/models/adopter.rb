class Adopter < ApplicationRecord
  has_many :users, as: :userable
  has_one :adoption_preference

  validates :name, presence: true, length: {maximum: 40}
  validates :last_name, presence: true, length: {maximum: 40}
  validates :address, length: {maximum: 80}
  validates :lonlat, presence: true, uniqueness: true

  validates :phone, presence: true, length: {minimun: 10, maximum: 13}
end
