require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@product = products(:one)
  end

  test "Product must belong to a Business" do
  	@product.business = nil
  	assert_not @product.valid?
  end

  test "Product must have a name" do
  	@product.name = nil
  	assert_not @product.valid?
  end

  test "Scope only highlighted products true" do
  	values = Product.highlighted.collect(&:highlighted)
  	assert_not_includes(values, false)
  end
end
