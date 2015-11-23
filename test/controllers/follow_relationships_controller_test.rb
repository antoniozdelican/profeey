require 'test_helper'

class FollowRelationshipsControllerTest < ActionController::TestCase
  # Adding Devise helper
  include Devise::TestHelpers
  
  test "create should require logged-in user" do
    assert_no_difference 'FollowRelationship.count' do
      post :create
    end
    assert_redirected_to new_user_session_path
  end

  test "destroy should require logged-in user" do
    assert_no_difference 'FollowRelationship.count' do
      delete :destroy, id: follow_relationships(:one)
    end
    assert_redirected_to new_user_session_path
  end
end
