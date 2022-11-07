require "test_helper"

class Publics::LandPercelsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_land_percels_show_url
    assert_response :success
  end
end
