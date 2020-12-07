require 'test_helper'

class EleveControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get eleve_index_url
    assert_response :success
  end

end
