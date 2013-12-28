require 'test_helper'

class StoritevsControllerTest < ActionController::TestCase
  setup do
    @storitev = storitevs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storitevs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storitev" do
    assert_difference('Storitev.count') do
      post :create, storitev: { cenaNaKos: @storitev.cenaNaKos, opis: @storitev.opis, skupnaKolicina: @storitev.skupnaKolicina, uporabnik_id: @storitev.uporabnik_id }
    end

    assert_redirected_to storitev_path(assigns(:storitev))
  end

  test "should show storitev" do
    get :show, id: @storitev
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @storitev
    assert_response :success
  end

  test "should update storitev" do
    patch :update, id: @storitev, storitev: { cenaNaKos: @storitev.cenaNaKos, opis: @storitev.opis, skupnaKolicina: @storitev.skupnaKolicina, uporabnik_id: @storitev.uporabnik_id }
    assert_redirected_to storitev_path(assigns(:storitev))
  end

  test "should destroy storitev" do
    assert_difference('Storitev.count', -1) do
      delete :destroy, id: @storitev
    end

    assert_redirected_to storitevs_path
  end
end
