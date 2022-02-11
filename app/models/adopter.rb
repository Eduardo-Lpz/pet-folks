class Adopter < ApplicationRecord
  has_many :users, as: :userable
  has_one :adopter_preference

  accepts_nested_attributes_for :users

  validates :name, presence: true, length: {maximum: 40}
  validates :last_name, presence: true, length: {maximum: 40}
end
