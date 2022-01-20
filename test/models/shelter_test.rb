require "test_helper"

class ShelterTest < ActiveSupport::TestCase
  test "shelter params are valid" do
    assert shelters(:valid_shelter).valid?
  end

  test "shelter is invalid when name is invalid" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.name = nil
    refute shelter.valid?

    shelter.name = "x" * 81
    refute shelter.valid?
  end

  test "shelter is invalid when address is invalid" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.address = nil
    refute shelter.valid?

    shelter.address = "x" * 81
    refute shelter.valid?
  end

  test "shelter is invalid when phone is invalid" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.phone = nil
    refute shelter.valid?

    shelter.phone = "x" * 14
    refute shelter.valid?
  end

  test "shelter is invalid when email is invalid" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.email = nil
    assert shelter.valid?

    shelter.email = "invalid-email@com"
    refute shelter.valid?
  end

  test "shelter does not run validation when email is blank" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.email = nil
    assert shelter.valid?
  end

  test "shelter is invalid when link is invalid" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.link = "x" * 61
    refute shelter.valid?
  end

  test "shelter is invalid when description is invalid" do
    shelter = shelters(:valid_shelter)
    assert shelter.valid?

    shelter.description = "x" * 501
    refute shelter.valid?
  end
end
