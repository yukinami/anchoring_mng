require 'test_helper'

class AnchorageGroundsControllerTest < ActionController::TestCase
  setup do
    @anchorage_ground = anchorage_grounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anchorage_grounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anchorage_ground" do
    assert_difference('AnchorageGround.count') do
      post :create, anchorage_ground: { name: @anchorage_ground.name }
    end

    assert_redirected_to anchorage_ground_path(assigns(:anchorage_ground))
  end

  test "should show anchorage_ground" do
    get :show, id: @anchorage_ground
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anchorage_ground
    assert_response :success
  end

  test "should update anchorage_ground" do
    put :update, id: @anchorage_ground, anchorage_ground: { name: @anchorage_ground.name }
    assert_redirected_to anchorage_ground_path(assigns(:anchorage_ground))
  end

  test "should destroy anchorage_ground" do
    assert_difference('AnchorageGround.count', -1) do
      delete :destroy, id: @anchorage_ground
    end

    assert_redirected_to anchorage_grounds_path
  end
end
