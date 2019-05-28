require 'test_helper'

class BillsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bills_new_url
    assert_response :success
  end

  test "should get edit" do
    get bills_edit_url
    assert_response :success
  end

end
