require 'test_helper'

class UporabniksControllerTest < ActionController::TestCase
  setup do
    @uporabnik = uporabniks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uporabniks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uporabnik" do
    assert_difference('Uporabnik.count') do
      post :create, uporabnik: { davcna: @uporabnik.davcna, ddv: @uporabnik.ddv, email: @uporabnik.email, geslo: @uporabnik.geslo, ime: @uporabnik.ime, naslov: @uporabnik.naslov, nazivPodjetja: @uporabnik.nazivPodjetja, posta_id: @uporabnik.posta_id, priimek: @uporabnik.priimek, telefon: @uporabnik.telefon, trr: @uporabnik.trr }
    end

    assert_redirected_to uporabnik_path(assigns(:uporabnik))
  end

  test "should show uporabnik" do
    get :show, id: @uporabnik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uporabnik
    assert_response :success
  end

  test "should update uporabnik" do
    patch :update, id: @uporabnik, uporabnik: { davcna: @uporabnik.davcna, ddv: @uporabnik.ddv, email: @uporabnik.email, geslo: @uporabnik.geslo, ime: @uporabnik.ime, naslov: @uporabnik.naslov, nazivPodjetja: @uporabnik.nazivPodjetja, posta_id: @uporabnik.posta_id, priimek: @uporabnik.priimek, telefon: @uporabnik.telefon, trr: @uporabnik.trr }
    assert_redirected_to uporabnik_path(assigns(:uporabnik))
  end

  test "should destroy uporabnik" do
    assert_difference('Uporabnik.count', -1) do
      delete :destroy, id: @uporabnik
    end

    assert_redirected_to uporabniks_path
  end
end
