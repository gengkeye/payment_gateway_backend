require 'test_helper'

class IntroductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get joint_escrow" do
    get introductions_joint_escrow_url
    assert_response :success
  end

  test "should get payments_processing" do
    get introductions_payments_processing_url
    assert_response :success
  end

  test "should get payroll" do
    get introductions_payroll_url
    assert_response :success
  end

end
