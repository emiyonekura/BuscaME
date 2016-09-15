require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get set_adress" do
    get pages_set_adress_url
    assert_response :success
  end

end
