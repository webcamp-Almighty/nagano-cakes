require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get orders_index_url
    assert_response :success
  end

  test "should get new" do
    get orders_new_url
    assert_response :success
  end

  test "should get show" do
    get orders_show_url
    assert_response :success
  end

  test "should get detail" do
    get orders_detail_url
    assert_response :success
  end

  test "should get finish" do
    get orders_finish_url
    assert_response :success
  end

end
