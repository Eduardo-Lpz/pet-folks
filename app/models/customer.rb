class Customer < ApplicationRecord
  devise :database_authenticatable,
    :recoverable,
    :rememberable,
    :validatable

  belongs_to :shelter

  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {case_sensitive: false}, unless: proc { |c| c.email.blank? }
end
