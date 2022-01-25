require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "customer params are valid" do
    assert customers(:valid_customer).valid?
  end

  test "customer has a valid shelter" do
    assert customers(:valid_customer).shelter.valid?
  end

  test "customer is invalid when email is invalid" do
    customer = customers(:valid_customer)

    customer.email = "invalid-email@com"
    refute customer.valid?
  end

  test "customer does not run validation when email is blank" do
    customer = customers(:valid_customer)

    customer.email = nil
    refute customer.valid?
  end
end
