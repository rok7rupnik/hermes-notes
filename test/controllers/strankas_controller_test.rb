require 'test_helper'

class StrankasControllerTest < ActionController::TestCase
  setup do
    @stranka = strankas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:strankas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stranka" do
    assert_difference('Stranka.count') do
      post :create, stranka: { davcna: @stranka.davcna, ddv: @stranka.ddv, email: @stranka.email, ime: @stranka.ime, naslov: @stranka.naslov, nazivPodjetja: @stranka.nazivPodjetja, posta_id: @stranka.posta_id, priimek: @stranka.priimek, telefon: @stranka.telefon, trr: @stranka.trr }
    end

    assert_redirected_to stranka_path(assigns(:stranka))
  end

  test "should show stranka" do
    get :show, id: @stranka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stranka
    assert_response :success
  end

  test "should update stranka" do
    patch :update, id: @stranka, stranka: { davcna: @stranka.davcna, ddv: @stranka.ddv, email: @stranka.email, ime: @stranka.ime, naslov: @stranka.naslov, nazivPodjetja: @stranka.nazivPodjetja, posta_id: @stranka.posta_id, priimek: @stranka.priimek, telefon: @stranka.telefon, trr: @stranka.trr }
    assert_redirected_to stranka_path(assigns(:stranka))
  end

  test "should destroy stranka" do
    assert_difference('Stranka.count', -1) do
      delete :destroy, id: @stranka
    end

    assert_redirected_to strankas_path
  end
end
