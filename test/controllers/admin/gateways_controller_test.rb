require 'test_helper'

class Admin::GatewaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gateways_index_url
    assert_response :success
  end

end
