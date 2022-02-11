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
    enum distance: {
      short_distance: 5_000,
      small_distance: 10_000,
      large_distance: 25_000,
      big_distance: 50_000
    }

    validates :specie, presence: true
    validates :gender, presence: true
    validates :age, presence: true
    validates :size, presence: true

    validates :special_needs, inclusion: [true, false]
  end
end
