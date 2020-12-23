require 'test_helper'

class LnwriteControllerTest < ActionDispatch::IntegrationTest
  test "should get button" do
    get lnwrite_button_url
    assert_response :success
  end

  test "should get form" do
    get lnwrite_form_url
    assert_response :success
  end

end
