require 'test_helper'

class GermanGoLeaguesControllerTest < ActionController::TestCase
  setup do
    @german_go_league = german_go_leagues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:german_go_leagues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create german_go_league" do
    assert_difference('GermanGoLeague.count') do
      post :create, german_go_league: @german_go_league.attributes
    end

    assert_redirected_to german_go_league_path(assigns(:german_go_league))
  end

  test "should show german_go_league" do
    get :show, id: @german_go_league.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @german_go_league.to_param
    assert_response :success
  end

  test "should update german_go_league" do
    put :update, id: @german_go_league.to_param, german_go_league: @german_go_league.attributes
    assert_redirected_to german_go_league_path(assigns(:german_go_league))
  end

  test "should destroy german_go_league" do
    assert_difference('GermanGoLeague.count', -1) do
      delete :destroy, id: @german_go_league.to_param
    end

    assert_redirected_to german_go_leagues_path
  end
end
