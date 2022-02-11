class Rescuer < ApplicationRecord
  has_many :users, as: :userable
  has_many :pets, through: :users

  accepts_nested_attributes_for :users

  validates :name, presence: true, length: {maximum: 80}
end
