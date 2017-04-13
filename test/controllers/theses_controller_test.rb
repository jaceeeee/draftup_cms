require 'test_helper'

class ThesesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get theses_index_url
    assert_response :success
  end

  test "should get new" do
    get theses_new_url
    assert_response :success
  end

  test "should get create" do
    get theses_create_url
    assert_response :success
  end

  test "should get destroy" do
    get theses_destroy_url
    assert_response :success
  end

end
