require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "user params are valid" do
    assert users(:valid_user).valid?
  end

  test "user is invalid when name is invalid" do
    user = users(:valid_user)

    user.name = nil
    refute user.valid?

    user.name = "x" * 31
    refute user.valid?
  end

  test "user is invalid when last_name is invalid" do
    user = users(:valid_user)

    user.last_name = nil
    refute user.valid?

    user.last_name = "x" * 31
    refute user.valid?
  end

  test "user is invalid when email is invalid" do
    user = users(:valid_user)

    user.email = "invalid-email@com"
    refute user.valid?
  end

  test "user does not run validation when email is blank" do
    user = users(:valid_user)

    user.email = nil
    refute user.valid?
  end
  test "user is invalid when address is invalid" do
    user = users(:valid_user)

    user.address = "x" * 81
    refute user.valid?
  end

  test "user is invalid when phone is invalid" do
    user = users(:valid_user)

    user.phone = nil
    refute user.valid?

    user.phone = "x" * 14
    refute user.valid?
  end
end
