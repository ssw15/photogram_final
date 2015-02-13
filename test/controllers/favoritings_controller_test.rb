require 'test_helper'

class FavoritingsControllerTest < ActionController::TestCase
  setup do
    @favoriting = favoritings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:favoritings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create favoriting" do
    assert_difference('Favoriting.count') do
      post :create, favoriting: { favorited_by_id: @favoriting.favorited_by_id, photo_id: @favoriting.photo_id }
    end

    assert_redirected_to favoriting_path(assigns(:favoriting))
  end

  test "should show favoriting" do
    get :show, id: @favoriting
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @favoriting
    assert_response :success
  end

  test "should update favoriting" do
    patch :update, id: @favoriting, favoriting: { favorited_by_id: @favoriting.favorited_by_id, photo_id: @favoriting.photo_id }
    assert_redirected_to favoriting_path(assigns(:favoriting))
  end

  test "should destroy favoriting" do
    assert_difference('Favoriting.count', -1) do
      delete :destroy, id: @favoriting
    end

    assert_redirected_to favoritings_path
  end
end
