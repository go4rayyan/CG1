require "test_helper"

class FlagTest < ActiveSupport::TestCase

  # Validations Tests
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name)

  # Association Tests
  should have_many(:result_flags)
  should have_many(:results).through(:result_flags)
  should have_many(:subscribers)
  should belong_to(:workflow)

  # Load Fixture
  flag_result = Flag.first

  # Instance Method Tests
  test "executes subscriber_list correctly" do
    assert_equal(flag_result.subscriber_list, "test_email@example.com")
  end

  test "executes setter subscriber_list correctly" do
    assert_equal(flag_result.subscriber_list="test_email2@example.com", "test_email2@example.com")
  end

end
