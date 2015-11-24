require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  def setup
    @user = users(:antonio)
    # This code is not idiomatically correct.
    @thing = Thing.new(title: "My new thing", 
                      description: "This is my new thing I've been working on", 
                      user_id: @user.id)
  end

  test "should be valid" do
    assert @thing.valid?
  end

  test "user id should be present" do
    @thing.user_id = nil
    assert_not @thing.valid?
  end

  test "title should be present" do
    @thing.title = "   "
    assert_not @thing.valid?
  end

  test "title should be at most 80 characters" do
    @thing.title = "a" * 81
    assert_not @thing.valid?
  end

  test "description doesn't have to be present" do
    @thing.description = nil
    assert @thing.valid?
  end

  test "description is removed of leading and trailing whitespace" do
    @thing.description = " blabla   "
    @thing.save
    assert_equal "blabla", @thing.description
  end

  test "description is set to nil if empty description" do
    @thing.description = "   "
    @thing.save
    assert_equal nil, @thing.description
  end

  test "description should be at most 2000 characters" do
    @thing.description = "a" * 2001
    assert_not @thing.valid?
  end
end
