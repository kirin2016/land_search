require "test_helper"

class Admins::ImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_images_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_images_destroy_url
    assert_response :success
  end
end
