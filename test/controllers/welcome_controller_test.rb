require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get s_welcome" do
    get welcome_s_welcome_url
    assert_response :success
  end

  test "should get t_welcome" do
    get welcome_t_welcome_url
    assert_response :success
  end

end
