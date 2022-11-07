require "test_helper"

class Publics::PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_properties_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_properties_show_url
    assert_response :success
  end

  test "should get search" do
    get publics_properties_search_url
    assert_response :success
  end
end
