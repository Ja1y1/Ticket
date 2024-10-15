require "test_helper"

class TiktsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tikt = tikts(:one)
  end

  test "should get index" do
    get tikts_url, as: :json
    assert_response :success
  end

  test "should create tikt" do
    assert_difference("Tikt.count") do
      post tikts_url, params: { tikt: { code: @tikt.code } }, as: :json
    end

    assert_response :created
  end

  test "should show tikt" do
    get tikt_url(@tikt), as: :json
    assert_response :success
  end

  test "should update tikt" do
    patch tikt_url(@tikt), params: { tikt: { code: @tikt.code } }, as: :json
    assert_response :success
  end

  test "should destroy tikt" do
    assert_difference("Tikt.count", -1) do
      delete tikt_url(@tikt), as: :json
    end

    assert_response :no_content
  end
end
