require 'test_helper'

class Admin::AdminControllerTest < ActionController::TestCase
  test "should get update_profile" do
    get :update_profile
    assert_response :success
  end

end
