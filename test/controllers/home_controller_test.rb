require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # Adding Devise helper
  include Devise::TestHelpers

  def setup
    @user = users(:antonio)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_select 'a[href=?]', root_path, count: 1
  end

  test 'should have default links if user not signed in' do
    get :index
    assert_select 'a[href=?]', new_user_registration_path
    assert_select 'a[href=?]', new_user_password_path
  end

  test 'should have home page links if user signed in' do
    sign_in @user
    get :index
    assert_select 'a[href=?]', new_user_registration_path, false
    assert_select 'a[href=?]', destroy_user_session_path
  end
end
