require 'test_helper'

class CollaborationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collaborations_index_url
    assert_response :success
  end

  test "should get show" do
    get collaborations_show_url
    assert_response :success
  end

  test "should get new" do
    get collaborations_new_url
    assert_response :success
  end

  test "should get edit" do
    get collaborations_edit_url
    assert_response :success
  end

  test "should get delete" do
    get collaborations_delete_url
    assert_response :success
  end

end
