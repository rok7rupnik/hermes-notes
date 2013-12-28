require 'test_helper'

class PostaControllerTest < ActionController::TestCase
  setup do
    @postum = posta(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posta)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create postum" do
    assert_difference('Posta.count') do
      post :create, postum: { naziv: @postum.naziv, postnaSt: @postum.postnaSt }
    end

    assert_redirected_to postum_path(assigns(:postum))
  end

  test "should show postum" do
    get :show, id: @postum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @postum
    assert_response :success
  end

  test "should update postum" do
    patch :update, id: @postum, postum: { naziv: @postum.naziv, postnaSt: @postum.postnaSt }
    assert_redirected_to postum_path(assigns(:postum))
  end

  test "should destroy postum" do
    assert_difference('Posta.count', -1) do
      delete :destroy, id: @postum
    end

    assert_redirected_to posta_index_path
  end
end
