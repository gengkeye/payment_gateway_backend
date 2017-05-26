require 'test_helper'

class Admin::WithdrawsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_withdraws_index_url
    assert_response :success
  end

  test "should get enable" do
    get admin_withdraws_enable_url
    assert_response :success
  end

  test "should get disable" do
    get admin_withdraws_disable_url
    assert_response :success
  end

end
