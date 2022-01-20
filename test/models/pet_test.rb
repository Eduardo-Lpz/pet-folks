require "test_helper"

class PetTest < ActiveSupport::TestCase
  test "pet params are valid" do
    assert pets(:valid_pet).valid?
  end

  test "pet is invalid when specie is missing or invalid" do
    pet = pets(:valid_pet)
    assert pet.valid?

    pet.specie = nil
    refute pet.valid?

    assert_raise(ArgumentError) { pet.specie = "invalid" }
  end

  test "pet is invalid when gender is missing or invalid" do
    pet = pets(:valid_pet)
    assert pet.valid?

    pet.gender = nil
    refute pet.valid?

    assert_raise(ArgumentError) { pet.specie = "invalid" }
  end

  test "pet is invalid when age is missing or invalid" do
    pet = pets(:valid_pet)
    assert pet.valid?

    pet.age = nil
    refute pet.valid?

    assert_raise(ArgumentError) { pet.age = "invalid" }
  end

  test "pet is invalid when size is missing or invalid" do
    pet = pets(:valid_pet)
    assert pet.valid?

    pet.size = nil
    refute pet.valid?

    assert_raise(ArgumentError) { pet.size = "invalid" }
  end

  test "pet is invalid when special_need option is not a boolean" do
    pet = pets(:valid_pet)
    assert pet.valid?

    pet.special_needs = nil
    refute pet.valid?
  end

  test "pet is invalid when is_adopted option is not a boolean" do
    pet = pets(:valid_pet)
    assert pet.valid?

    pet.is_adopted = nil
    refute pet.valid?
  end
end
