require "test_helper"

class Publics::PlanOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_plan_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_plan_orders_show_url
    assert_response :success
  end
end
