require 'test_helper'

class Admin::DocsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_docs_index_url
    assert_response :success
  end

end
