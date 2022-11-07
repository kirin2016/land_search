require "test_helper"

class Admins::LandPercelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_land_percels_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_land_percels_edit_url
    assert_response :success
  end
end
