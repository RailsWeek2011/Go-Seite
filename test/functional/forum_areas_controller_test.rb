require 'test_helper'

class ForumAreasControllerTest < ActionController::TestCase
  setup do
    @forum_area = forum_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:forum_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create forum_area" do
    assert_difference('ForumArea.count') do
      post :create, forum_area: @forum_area.attributes
    end

    assert_redirected_to forum_area_path(assigns(:forum_area))
  end

  test "should show forum_area" do
    get :show, id: @forum_area.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @forum_area.to_param
    assert_response :success
  end

  test "should update forum_area" do
    put :update, id: @forum_area.to_param, forum_area: @forum_area.attributes
    assert_redirected_to forum_area_path(assigns(:forum_area))
  end

  test "should destroy forum_area" do
    assert_difference('ForumArea.count', -1) do
      delete :destroy, id: @forum_area.to_param
    end

    assert_redirected_to forum_areas_path
  end
end
