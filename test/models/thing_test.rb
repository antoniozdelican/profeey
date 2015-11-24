require 'test_helper'

class ThingTest < ActiveSupport::TestCase
  def setup
    @user = users(:antonio)
    @thing = @user.things.build(title: "My new thing", 
                              description: "This is my new thing I've been working on")
  end

  test "should be valid" do
    assert @thing.valid?
  end

  test "user id should be present" do
    @thing.user_id = nil
    assert_not @thing.valid?
  end

  test "thing should belong to the user" do
    assert_equal @user, @thing.user
  end

  test "user should containt the thing" do
    assert_includes @user.things, @thing
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

  test "order of things should be most recent first" do
    assert_equal things(:last), Thing.first
  end
end
