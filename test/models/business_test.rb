require 'test_helper'

class BusinessTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@business = businesses(:one)
  end

  test "Business must belong to a user" do
  	@business.user = nil
  	assert_not @business.valid?
  end

  test "Business must have a name" do
  	@business.name = nil
  	assert_not @business.valid?
  end
end
