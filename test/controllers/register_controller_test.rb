require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should get register" do
    get register_url
    assert_response :success
  end
end
