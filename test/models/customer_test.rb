require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "customer params are valid" do
    assert customers(:valid_customer).valid?
  end

  test "customer has a valid shelter" do
    assert customers(:valid_customer).shelter.valid?
  end

  test "customer is invalid when name is invalid" do
    customer = customers(:valid_customer)
    assert customer.valid?

    customer.name = nil
    refute customer.valid?

    customer.name = "x" * 31
    refute customer.valid?
  end

  test "customer is invalid when last_name is invalid" do
    customer = customers(:valid_customer)
    assert customer.valid?

    customer.last_name = nil
    refute customer.valid?

    customer.last_name = "x" * 31
    refute customer.valid?
  end

  test "customer is invalid when email is invalid" do
    customer = customers(:valid_customer)
    assert customer.valid?

    customer.email = "invalid-email@com"
    refute customer.valid?
  end

  test "customer does not run validation when email is blank" do
    customer = customers(:valid_customer)
    assert customer.valid?

    customer.email = nil
    assert customer.valid?
  end
  test "customer is invalid when address is invalid" do
    customer = customers(:valid_customer)
    assert customer.valid?

    customer.address = nil
    refute customer.valid?

    customer.address = "x" * 81
    refute customer.valid?
  end

  test "customer is invalid when phone is invalid" do
    customer = customers(:valid_customer)
    assert customer.valid?

    customer.phone = nil
    refute customer.valid?

    customer.phone = "x" * 14
    refute customer.valid?
  end
end
