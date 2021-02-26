require 'test_helper'

class GenealogysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get genealogys_new_url
    assert_response :success
  end

  test "should get create" do
    get genealogys_create_url
    assert_response :success
  end

  test "should get index" do
    get genealogys_index_url
    assert_response :success
  end

  test "should get show" do
    get genealogys_show_url
    assert_response :success
  end

  test "should get edit" do
    get genealogys_edit_url
    assert_response :success
  end

  test "should get update" do
    get genealogys_update_url
    assert_response :success
  end

  test "should get destroy" do
    get genealogys_destroy_url
    assert_response :success
  end

end
