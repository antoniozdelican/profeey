require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  include Devise::TestHelpers
  def setup
    @user = users(:antonio)
    @other_user = users(:ivan)
  end
  test "should redirect index when not logged in" do
      get :index
      assert_redirected_to new_user_session_path
    end
  test "should redirect followers when not logged in" do
    get :followers, id: @user
    assert_redirected_to new_user_session_path
  end
  test "should redirect following when not logged in" do
    get :following, id: @user
    assert_redirected_to new_user_session_path
  end
end
