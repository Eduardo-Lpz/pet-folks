class AdoptionPreference < ApplicationRecord
  include PetCharacteristicConcern

  belongs_to :user
end
