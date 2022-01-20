class Shelter < ApplicationRecord
  include AccountDetailConcern

  has_many :pets, dependent: :delete_all
  has_one :user, dependent: :destroy

  validates :name, presence: true, length: {maximum: 80}
  validates :link, length: {maximum: 60}
  validates :description, length: {maximum: 500}
end
