require "test_helper"

class AdopterPreferenceTest < ActiveSupport::TestCase
  test "adopter_preference params are valid" do
    assert adopter_preferences(:valid_adopter_preference).valid?
  end

  test "adopter_preference is invalid when specie is missing or invalid" do
    adopter_preference = adopter_preferences(:valid_adopter_preference)

    adopter_preference.specie = nil
    refute adopter_preference.valid?

    assert_raise(ArgumentError) { adopter_preference.specie = "invalid" }
  end

  test "adopter_preference is invalid when gender is missing or invalid" do
    adopter_preference = adopter_preferences(:valid_adopter_preference)

    adopter_preference.gender = nil
    refute adopter_preference.valid?

    assert_raise(ArgumentError) { adopter_preference.specie = "invalid" }
  end

  test "adopter_preference is invalid when age is missing or invalid" do
    adopter_preference = adopter_preferences(:valid_adopter_preference)

    adopter_preference.age = nil
    refute adopter_preference.valid?

    assert_raise(ArgumentError) { adopter_preference.age = "invalid" }
  end

  test "adopter_preference is invalid when size is missing or invalid" do
    adopter_preference = adopter_preferences(:valid_adopter_preference)

    adopter_preference.size = nil
    refute adopter_preference.valid?

    assert_raise(ArgumentError) { adopter_preference.size = "invalid" }
  end

  test "adopter_preference is invalid when special_need option is not a boolean" do
    adopter_preference = adopter_preferences(:valid_adopter_preference)

    adopter_preference.special_needs = nil
    refute adopter_preference.valid?
  end
end
