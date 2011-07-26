require 'test_helper'

class TournamentResultsControllerTest < ActionController::TestCase
  setup do
    @tournament_result = tournament_results(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_results)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_result" do
    assert_difference('TournamentResult.count') do
      post :create, tournament_result: @tournament_result.attributes
    end

    assert_redirected_to tournament_result_path(assigns(:tournament_result))
  end

  test "should show tournament_result" do
    get :show, id: @tournament_result.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_result.to_param
    assert_response :success
  end

  test "should update tournament_result" do
    put :update, id: @tournament_result.to_param, tournament_result: @tournament_result.attributes
    assert_redirected_to tournament_result_path(assigns(:tournament_result))
  end

  test "should destroy tournament_result" do
    assert_difference('TournamentResult.count', -1) do
      delete :destroy, id: @tournament_result.to_param
    end

    assert_redirected_to tournament_results_path
  end
end
