require "test_helper"

class JournalistRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get journalist_requests_new_url
    assert_response :success
  end

  test "should get create" do
    get journalist_requests_create_url
    assert_response :success
  end

  test "should get index" do
    get journalist_requests_index_url
    assert_response :success
  end

  test "should get approve" do
    get journalist_requests_approve_url
    assert_response :success
  end

  test "should get reject" do
    get journalist_requests_reject_url
    assert_response :success
  end
end
