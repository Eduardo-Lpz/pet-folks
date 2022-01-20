require "test_helper"

class AdoptionPreferenceTest < ActiveSupport::TestCase
  test "adoption_preference params are valid" do
    assert adoption_preferences(:valid_adoption_preference).valid?
  end

  test "adoption_preference is invalid when specie is missing or invalid" do
    adoption_preference = adoption_preferences(:valid_adoption_preference)
    assert adoption_preference.valid?

    adoption_preference.specie = nil
    refute adoption_preference.valid?

    assert_raise(ArgumentError) { adoption_preference.specie = "invalid" }
  end

  test "adoption_preference is invalid when gender is missing or invalid" do
    adoption_preference = adoption_preferences(:valid_adoption_preference)
    assert adoption_preference.valid?

    adoption_preference.gender = nil
    refute adoption_preference.valid?

    assert_raise(ArgumentError) { adoption_preference.specie = "invalid" }
  end

  test "adoption_preference is invalid when age is missing or invalid" do
    adoption_preference = adoption_preferences(:valid_adoption_preference)
    assert adoption_preference.valid?

    adoption_preference.age = nil
    refute adoption_preference.valid?

    assert_raise(ArgumentError) { adoption_preference.age = "invalid" }
  end

  test "adoption_preference is invalid when size is missing or invalid" do
    adoption_preference = adoption_preferences(:valid_adoption_preference)
    assert adoption_preference.valid?

    adoption_preference.size = nil
    refute adoption_preference.valid?

    assert_raise(ArgumentError) { adoption_preference.size = "invalid" }
  end

  test "adoption_preference is invalid when special_need option is not a boolean" do
    adoption_preference = adoption_preferences(:valid_adoption_preference)
    assert adoption_preference.valid?

    adoption_preference.special_needs = nil
    refute adoption_preference.valid?
  end
end
