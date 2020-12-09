require 'test_helper'

class PWelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get p_welcome_sign_up_url
    assert_response :success
  end

end
