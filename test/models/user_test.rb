require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should follow and unfollow a user" do
    antonio = users(:antonio)
    ivan  = users(:ivan)
    assert_not antonio.following?(ivan)
    antonio.follow(ivan)
    assert antonio.following?(ivan)
    assert ivan.followers.include?(antonio)
    antonio.unfollow(ivan)
    assert_not antonio.following?(ivan)
  end
end
