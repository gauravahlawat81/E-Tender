require 'test_helper'

class Doc10sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc10 = doc10s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc10" do
    assert_difference('Doc10.count') do
      post :create, params: { tender_id: @tender, doc10: @doc10.attributes }
    end

    assert_redirected_to tender_doc10_path(@tender, Doc10.last)
  end

  test "should show doc10" do
    get :show, params: { tender_id: @tender, id: @doc10 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc10 }
    assert_response :success
  end

  test "should update doc10" do
    put :update, params: { tender_id: @tender, id: @doc10, doc10: @doc10.attributes }
    assert_redirected_to tender_doc10_path(@tender, Doc10.last)
  end

  test "should destroy doc10" do
    assert_difference('Doc10.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc10 }
    end

    assert_redirected_to tender_doc10s_path(@tender)
  end
end
