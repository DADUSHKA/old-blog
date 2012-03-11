require 'test_helper'

class User::SessionsControllerTest < ActionController::TestCase
  test "should authenticate" do
    attrs = {}
    user = Factory :active_user
    attrs[:email] = user.email
    attrs[:password] = user.password
    post :create, :user => attrs
    assert_response :redirect
    assert signed_in?
  end

  test "should not authenticate" do
    attrs = {}
    user = Factory :active_user
    attrs[:email] = user.email
    attrs[:password] = 'wrong_password'
    post :create, :user => attrs
    assert_response :success
    assert !signed_in?
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete destroy" do
    user = Factory(:user)
    sign_in(user)
    delete :destroy
    assert_response :redirect
    assert !signed_in?
  end

end
