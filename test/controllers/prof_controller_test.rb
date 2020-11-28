require 'test_helper'

class ProfControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get prof_index_url
    assert_response :success
  end

end
