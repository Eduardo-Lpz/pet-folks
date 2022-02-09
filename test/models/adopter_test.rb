require "test_helper"

class AdopterTest < ActiveSupport::TestCase
  test "adopter params are valid" do
    assert adopters(:valid_adopter).valid?
  end

  test "adopter is invalid when name is invalid" do
    adopter = adopters(:valid_adopter)

    adopter.name = nil
    refute adopter.valid?

    adopter.name = "x" * 41
    refute adopter.valid?
  end

  test "adopter is invalid when last_name is invalid" do
    adopter = adopters(:valid_adopter)

    adopter.last_name = nil
    refute adopter.valid?

    adopter.last_name = "x" * 41
    refute adopter.valid?
  end

  test "adopter is invalid when address is invalid" do
    adopter = adopters(:valid_adopter)

    adopter.address = "x" * 121
    refute adopter.valid?
  end

  test "adopter is invalid when phone is invalid" do
    adopter = adopters(:valid_adopter)

    adopter.phone = nil
    refute adopter.valid?

    adopter.phone = "x" * 14
    refute adopter.valid?
  end
end
