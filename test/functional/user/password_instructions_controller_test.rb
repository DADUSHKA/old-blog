require 'test_helper'

class User::PasswordInstructionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be put update" do
    attrs = {}
    user = Factory :active_user
    attrs[:email] = user.email
    post :create, :user => attrs
    assert_response :redirect
  end
end
