require "test_helper"

class ShelterTest < ActiveSupport::TestCase
  test "shelter params are valid" do
    assert shelters(:valid_shelter).valid?
  end

  test "shelter is invalid when name is invalid" do
    shelter = shelters(:valid_shelter)

    shelter.name = nil
    refute shelter.valid?

    shelter.name = "x" * 81
    refute shelter.valid?
  end

  test "shelter is invalid when address is invalid" do
    shelter = shelters(:valid_shelter)

    shelter.address = nil
    assert shelter.valid?

    shelter.address = "x" * 81
    refute shelter.valid?
  end

  test "shelter is invalid when phone is invalid" do
    shelter = shelters(:valid_shelter)

    shelter.phone = nil
    refute shelter.valid?

    shelter.phone = "x" * 14
    refute shelter.valid?
  end

  test "shelter is invalid when link is invalid" do
    shelter = shelters(:valid_shelter)

    shelter.link = "x" * 61
    refute shelter.valid?
  end

  test "shelter is invalid when description is invalid" do
    shelter = shelters(:valid_shelter)

    shelter.description = "x" * 501
    refute shelter.valid?
  end
end
