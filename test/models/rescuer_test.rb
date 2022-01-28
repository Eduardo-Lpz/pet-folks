require "test_helper"

class RescuerTest < ActiveSupport::TestCase
  test "rescuer params are valid" do
    assert rescuers(:valid_rescuer).valid?
  end

  test "rescuer is invalid when name is invalid" do
    rescuer = rescuers(:valid_rescuer)

    rescuer.name = nil
    refute rescuer.valid?

    rescuer.name = "x" * 81
    refute rescuer.valid?
  end

  test "rescuer is invalid when phone is invalid" do
    rescuer = rescuers(:valid_rescuer)

    rescuer.phone = nil
    refute rescuer.valid?

    rescuer.phone = "x" * 14
    refute rescuer.valid?
  end

  test "rescuer is invalid when description is invalid" do
    rescuer = rescuers(:valid_rescuer)

    rescuer.description = "x" * 501
    refute rescuer.valid?
  end
end
