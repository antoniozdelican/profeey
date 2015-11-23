require 'test_helper'

# Note: Paperclip is probably well tested already so need here!

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(full_name: "Some User", email: "someuser@mail.com", password: "user1234")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "full_name should be present" do
    @user.full_name = "     "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    # Check Devise email validation!!
    # invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
    #                        foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @user.password = @user.password = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length of 8" do
    @user.password = @user.password_confirmation = "a" * 7
    assert_not @user.valid?
  end

  test "professions sould be added to user and vice versa" do
    profession1 = professions(:student)
    profession2 = professions(:engineer)
    @user.professions << profession1
    @user.save
    assert_equal 1, @user.professions.count
    assert_includes profession1.users, @user
    @user.professions << profession2
    assert_equal 2, @user.professions.count
  end

  # test "professions sould not be duplicated to user" do
  #   profession = professions(:student)
  #   @user.professions << profession
  #   @user.professions << profession
  #   @user.save
  #   assert_not @user.valid?
  # end 

  test "should follow and unfollow a user" do
    antonio = users(:antonio)
    lea  = users(:lea)
    assert_not antonio.following?(lea)
    antonio.follow(lea)
    assert antonio.following?(lea)
    assert lea.followers.include?(antonio)
    antonio.unfollow(lea)
    assert_not antonio.following?(lea)
  end

  test "user should not be able to follow twice another user" do
    user1 = @user
    user1.save
    assert user1.valid?
    user2 = User.new(full_name: "Some User 2", email: "someuser2@mail.com", password: "user1234")
    user2.save
    user1.follow(user2)
    exception = assert_raise(Exception) {
      user1.follow(user2)
    }  
    assert_equal 1, user2.followers.count
  end
end
