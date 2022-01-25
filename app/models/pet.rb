class Pet < ApplicationRecord
  include PetCharacteristicConcern

  belongs_to :shelter
  has_many_attached :images

  validates :name, length: {maximum: 20}
  validates :coat, length: {maximum: 20}
  validates :color, length: {maximum: 20}
  validates :description, length: {maximum: 500}
  validates :is_adopted, inclusion: [true, false]
end
