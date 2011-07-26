require 'test_helper'

class TournamentInformationsControllerTest < ActionController::TestCase
  setup do
    @tournament_information = tournament_informations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tournament_informations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tournament_information" do
    assert_difference('TournamentInformation.count') do
      post :create, tournament_information: @tournament_information.attributes
    end

    assert_redirected_to tournament_information_path(assigns(:tournament_information))
  end

  test "should show tournament_information" do
    get :show, id: @tournament_information.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tournament_information.to_param
    assert_response :success
  end

  test "should update tournament_information" do
    put :update, id: @tournament_information.to_param, tournament_information: @tournament_information.attributes
    assert_redirected_to tournament_information_path(assigns(:tournament_information))
  end

  test "should destroy tournament_information" do
    assert_difference('TournamentInformation.count', -1) do
      delete :destroy, id: @tournament_information.to_param
    end

    assert_redirected_to tournament_informations_path
  end
end
