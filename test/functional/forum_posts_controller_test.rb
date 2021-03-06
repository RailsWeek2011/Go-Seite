require 'test_helper'

class ForumPostsControllerTest < ActionController::TestCase
  setup do
    @forum_post = forum_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_post" do
    assert_difference('ForumPost.count') do
      post :create, forum_post: @forum_post.attributes
    end

    assert_redirected_to forum_post_path(assigns(:forum_post))
  end

  test "should show forum_post" do
    get :show, id: @forum_post.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_post.to_param
    assert_response :success
  end

  test "should update forum_post" do
    put :update, id: @forum_post.to_param, forum_post: @forum_post.attributes
    assert_redirected_to forum_post_path(assigns(:forum_post))
  end

  test "should destroy forum_post" do
    assert_difference('ForumPost.count', -1) do
      delete :destroy, id: @forum_post.to_param
    end

    assert_redirected_to forum_posts_path
  end
end
