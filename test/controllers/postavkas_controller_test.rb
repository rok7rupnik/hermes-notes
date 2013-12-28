require 'test_helper'

class PostavkasControllerTest < ActionController::TestCase
  setup do
    @postavka = postavkas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:postavkas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postavka" do
    assert_difference('Postavka.count') do
      post :create, postavka: { kolicina: @postavka.kolicina, popust: @postavka.popust, racun_id: @postavka.racun_id, storitev_id: @postavka.storitev_id, zaporednaSt: @postavka.zaporednaSt }
    end

    assert_redirected_to postavka_path(assigns(:postavka))
  end

  test "should show postavka" do
    get :show, id: @postavka
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postavka
    assert_response :success
  end

  test "should update postavka" do
    patch :update, id: @postavka, postavka: { kolicina: @postavka.kolicina, popust: @postavka.popust, racun_id: @postavka.racun_id, storitev_id: @postavka.storitev_id, zaporednaSt: @postavka.zaporednaSt }
    assert_redirected_to postavka_path(assigns(:postavka))
  end

  test "should destroy postavka" do
    assert_difference('Postavka.count', -1) do
      delete :destroy, id: @postavka
    end

    assert_redirected_to postavkas_path
  end
end
