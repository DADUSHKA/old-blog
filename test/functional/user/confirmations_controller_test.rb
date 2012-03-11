require 'test_helper'

class User::ConfirmationsControllerTest < ActionController::TestCase
  test "should change user status" do
    user = Factory :waiting_email_confirmation_user
    post :create, :token => user.confirmation_token
    assert_response :redirect
    
    user.reload
    assert user.active?
    assert_equal current_user, user
  end
end
