require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should be post create" do
    attrs = FactoryGirl.attributes_for :user
    post :create, :user => attrs
    assert_response :redirect

    user = User.find_by_email(attrs[:email])
    assert user
    assert user.waiting_email_confirmation?
  end
end
