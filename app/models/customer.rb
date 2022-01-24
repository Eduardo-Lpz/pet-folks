class Customer < ApplicationRecord
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable

  include AccountDetailConcern

  belongs_to :shelter

  validates :name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
end
