class Shelter < ApplicationRecord
  has_many :users, as: :userable
  has_many :pets, through: :users

  accepts_nested_attributes_for :users

  validates :name, presence: true, length: {maximum: 80}
  validates :address, length: {maximum: 120}
  validates :lonlat, presence: true, uniqueness: true

  validates :phone, presence: true, length: {minimun: 10, maximum: 13}
  validates :link, length: {maximum: 60}
  validates :description, length: {maximum: 500}
end
