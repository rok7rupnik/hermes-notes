require 'test_helper'

class StroseksControllerTest < ActionController::TestCase
  setup do
    @strosek = stroseks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stroseks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create strosek" do
    assert_difference('Strosek.count') do
      post :create, strosek: { datum: @strosek.datum, opis: @strosek.opis, uporabnik_id: @strosek.uporabnik_id, znesek: @strosek.znesek }
    end

    assert_redirected_to strosek_path(assigns(:strosek))
  end

  test "should show strosek" do
    get :show, id: @strosek
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @strosek
    assert_response :success
  end

  test "should update strosek" do
    patch :update, id: @strosek, strosek: { datum: @strosek.datum, opis: @strosek.opis, uporabnik_id: @strosek.uporabnik_id, znesek: @strosek.znesek }
    assert_redirected_to strosek_path(assigns(:strosek))
  end

  test "should destroy strosek" do
    assert_difference('Strosek.count', -1) do
      delete :destroy, id: @strosek
    end

    assert_redirected_to stroseks_path
  end
end
