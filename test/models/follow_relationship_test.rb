require 'test_helper'

class FollowRelationshipTest < ActiveSupport::TestCase
  def setup
    @follow_relationship = FollowRelationship.new(follower_id: 1, followed_id: 2)
  end

  test "should be valid" do
    assert @follow_relationship.valid?
  end

  test "should require a follower_id" do
    @follow_relationship.follower_id = nil
    assert_not @follow_relationship.valid?
  end

  test "should require a followed_id" do
    @follow_relationship.followed_id = nil
    assert_not @follow_relationship.valid?
  end
end
