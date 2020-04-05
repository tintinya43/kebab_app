require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "authenticated? should return false for a user with nil digest" do
    assert_not @user.authenticated?('')
  end

end
