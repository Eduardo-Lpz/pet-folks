module PetCharacteristicConcern
  extend ActiveSupport::Concern

  included do
    enum specie: {dog: "dog", cat: "cat"}
    enum gender: {male: "male", female: "female"}
    enum age: {puppy: "puppy", young: "young", adult: "adult", senior: "senior"}
    enum size: {
      small: "small",
      medium: "medium",
      large: "large",
      extralarge: "extralarge"
    }

    validates :specie, presence: true
    validates :gender, presence: true
    validates :age, presence: true
    validates :size, presence: true

    validates :special_needs, inclusion: [true, false]
  end
end
