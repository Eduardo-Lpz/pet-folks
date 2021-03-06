class Pet < ApplicationRecord
  include PetCharacteristicConcern

  belongs_to :user
  has_many_attached :images

  validates :name, presence: true, length: {maximum: 20}
  validates :breed, presence: true, length: {maximum: 30}
  validates :coat, presence: true, length: {maximum: 20}
  validates :color, presence: true, length: {maximum: 20}
  validates :description, length: {maximum: 500}

  validates :is_adopted, inclusion: [true, false]
end
