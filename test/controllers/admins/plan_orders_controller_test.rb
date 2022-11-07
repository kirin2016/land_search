require "test_helper"

class Admins::PlanOrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_plan_order_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_plan_order_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_plan_order_update_url
    assert_response :success
  end
end
