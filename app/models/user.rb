class User < ApplicationRecord
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable

  belongs_to :userable, polymorphic: true
  has_many :pets

  validates :userable_id, uniqueness: true
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {case_sensitive: false}, unless: proc { |c| c.email.blank? }

  validates :address, length: {maximum: 120}
  validates :lonlat, presence: true, uniqueness: true
  validates :phone, presence: true, length: {minimun: 10, maximum: 13}
end
