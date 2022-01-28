class Rescuer < ApplicationRecord
  has_many :users, as: :userable

  validates :name, presence: true, length: {maximum: 80}
  validates :lonlat, presence: true, uniqueness: true

  validates :phone, presence: true, length: {minimun: 10, maximum: 13}
  validates :description, length: {maximum: 500}
end
