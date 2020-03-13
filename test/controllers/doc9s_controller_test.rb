require 'test_helper'

class Doc9sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc9 = doc9s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc9" do
    assert_difference('Doc9.count') do
      post :create, params: { tender_id: @tender, doc9: @doc9.attributes }
    end

    assert_redirected_to tender_doc9_path(@tender, Doc9.last)
  end

  test "should show doc9" do
    get :show, params: { tender_id: @tender, id: @doc9 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc9 }
    assert_response :success
  end

  test "should update doc9" do
    put :update, params: { tender_id: @tender, id: @doc9, doc9: @doc9.attributes }
    assert_redirected_to tender_doc9_path(@tender, Doc9.last)
  end

  test "should destroy doc9" do
    assert_difference('Doc9.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc9 }
    end

    assert_redirected_to tender_doc9s_path(@tender)
  end
end
