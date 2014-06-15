require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "fields must not be empty" do 
    user = User.new
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?

    user = User.new 
    user.name = ' '
    user.email = ' '
    user.password = ' '
    assert user.invalid?
    assert user.errors[:name].any?
    assert user.errors[:email].any?
    assert user.errors[:password].any?
  end


  test "mail must be an email" do 
    user = users(:one)
    user.email = 'hello'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'hello@'
    assert user.invalid?
    assert user.errors[:email].any?

    user.email = 'hello@hi.com'
    assert user.valid?
  end

 


end
