require 'test_helper'

class User::PasswordInstructionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be post create" do
    attrs = {}
    user = Factory :active_user
    attrs[:email] = user.email
    post :create, :user => attrs
    assert_response :redirect
  end
  
  test "should signed in" do
    user = Factory :active_user
    post :new, :auth_token => user.auth_token
    assert_response :success
    assert signed_in?
  end
end
