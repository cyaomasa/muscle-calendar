require "test_helper"

class Admin::PostRecordsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_post_records_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_post_records_show_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_post_records_destroy_url
    assert_response :success
  end
end
