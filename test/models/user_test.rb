require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'user with a valid email should be valid' do
    user= User.new(email: 'testuniqe@test.com', password_digest: 'passwort1')
    assert user.valid?
  end
  
  test 'user with invalid email not valid' do
    user = User.new(email: 'test', password_digest: 'test')
    assert_not user.valid?
  end

  test 'user with taken email is invalid' do
    other_user = users(:one)
    user = User.new(email: other_user.email , password_digest: 'passwort1')
    assert_not user.valid?
  end

end
