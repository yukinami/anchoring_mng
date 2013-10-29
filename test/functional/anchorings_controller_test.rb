require 'test_helper'

class AnchoringsControllerTest < ActionController::TestCase
  setup do
    @anchoring = anchorings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:anchorings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create anchoring" do
    assert_difference('Anchoring.count') do
      post :create, anchoring: { ahchor_reason: @anchoring.ahchor_reason, amount: @anchoring.amount, anchor_date: @anchoring.anchor_date, cargo: @anchoring.cargo, cellphone: @anchoring.cellphone, contacter: @anchoring.contacter, country: @anchoring.country, fax: @anchoring.fax, gt: @anchoring.gt, max_draft: @anchoring.max_draft, nt: @anchoring.nt, pier: @anchoring.pier, power: @anchoring.power, sail_date: @anchoring.sail_date, ship_contact: @anchoring.ship_contact, ship_length: @anchoring.ship_length, ship_name: @anchoring.ship_name, ship_name_en: @anchoring.ship_name_en, type: @anchoring.type }
    end

    assert_redirected_to anchoring_path(assigns(:anchoring))
  end

  test "should show anchoring" do
    get :show, id: @anchoring
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @anchoring
    assert_response :success
  end

  test "should update anchoring" do
    put :update, id: @anchoring, anchoring: { ahchor_reason: @anchoring.ahchor_reason, amount: @anchoring.amount, anchor_date: @anchoring.anchor_date, cargo: @anchoring.cargo, cellphone: @anchoring.cellphone, contacter: @anchoring.contacter, country: @anchoring.country, fax: @anchoring.fax, gt: @anchoring.gt, max_draft: @anchoring.max_draft, nt: @anchoring.nt, pier: @anchoring.pier, power: @anchoring.power, sail_date: @anchoring.sail_date, ship_contact: @anchoring.ship_contact, ship_length: @anchoring.ship_length, ship_name: @anchoring.ship_name, ship_name_en: @anchoring.ship_name_en, type: @anchoring.type }
    assert_redirected_to anchoring_path(assigns(:anchoring))
  end

  test "should destroy anchoring" do
    assert_difference('Anchoring.count', -1) do
      delete :destroy, id: @anchoring
    end

    assert_redirected_to anchorings_path
  end
end
