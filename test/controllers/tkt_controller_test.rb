require "test_helper"

class TktControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get tkt_show_url
    assert_response :success
  end
end
