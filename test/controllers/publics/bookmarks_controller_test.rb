require "test_helper"

class Publics::BookmarksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_bookmarks_index_url
    assert_response :success
  end

  test "should get create" do
    get publics_bookmarks_create_url
    assert_response :success
  end

  test "should get destroy" do
    get publics_bookmarks_destroy_url
    assert_response :success
  end
end
