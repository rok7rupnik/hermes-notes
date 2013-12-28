require 'test_helper'

class RacunsControllerTest < ActionController::TestCase
  setup do
    @racun = racuns(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:racuns)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create racun" do
    assert_difference('Racun.count') do
      post :create, racun: { datum: @racun.datum, stranka_id: @racun.stranka_id, uporabnik_id: @racun.uporabnik_id, znesek: @racun.znesek }
    end

    assert_redirected_to racun_path(assigns(:racun))
  end

  test "should show racun" do
    get :show, id: @racun
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @racun
    assert_response :success
  end

  test "should update racun" do
    patch :update, id: @racun, racun: { datum: @racun.datum, stranka_id: @racun.stranka_id, uporabnik_id: @racun.uporabnik_id, znesek: @racun.znesek }
    assert_redirected_to racun_path(assigns(:racun))
  end

  test "should destroy racun" do
    assert_difference('Racun.count', -1) do
      delete :destroy, id: @racun
    end

    assert_redirected_to racuns_path
  end
end
