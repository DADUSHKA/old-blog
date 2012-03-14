require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    post = Factory :post
    get :show, :id => post.id
    assert_response :success
  end
end
