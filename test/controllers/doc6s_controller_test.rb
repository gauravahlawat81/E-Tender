require 'test_helper'

class Doc6sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc6 = doc6s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc6" do
    assert_difference('Doc6.count') do
      post :create, params: { tender_id: @tender, doc6: @doc6.attributes }
    end

    assert_redirected_to tender_doc6_path(@tender, Doc6.last)
  end

  test "should show doc6" do
    get :show, params: { tender_id: @tender, id: @doc6 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc6 }
    assert_response :success
  end

  test "should update doc6" do
    put :update, params: { tender_id: @tender, id: @doc6, doc6: @doc6.attributes }
    assert_redirected_to tender_doc6_path(@tender, Doc6.last)
  end

  test "should destroy doc6" do
    assert_difference('Doc6.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc6 }
    end

    assert_redirected_to tender_doc6s_path(@tender)
  end
end
