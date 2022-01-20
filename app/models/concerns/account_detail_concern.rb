module AccountDetailConcern
  extend ActiveSupport::Concern

  included do
    validates :phone, presence: true, length: {minimun: 10, maximum: 13}
    validates :address, presence: true, length: {maximum: 80}
    validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}, uniqueness: {case_sensitive: false}, unless: proc { |c| c.email.blank? }
  end
end
