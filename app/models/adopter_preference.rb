class AdopterPreference < ApplicationRecord
  include PetCharacteristicConcern

  belongs_to :adopter
end
