require 'test_helper'

class Admin::PostsControllerTest < ActionController::TestCase
=begin
  def setup
    @post = Factory :post
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post crate" do
    post :ceate, :post => @post.attributes
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @post.attributes
    assert_response :success
  end

  test "should put update" do
    post :ceate, :id =>  :post => attrs
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
=end
end

