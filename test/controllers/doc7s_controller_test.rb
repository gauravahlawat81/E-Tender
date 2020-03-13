require 'test_helper'

class Doc7sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc7 = doc7s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc7" do
    assert_difference('Doc7.count') do
      post :create, params: { tender_id: @tender, doc7: @doc7.attributes }
    end

    assert_redirected_to tender_doc7_path(@tender, Doc7.last)
  end

  test "should show doc7" do
    get :show, params: { tender_id: @tender, id: @doc7 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc7 }
    assert_response :success
  end

  test "should update doc7" do
    put :update, params: { tender_id: @tender, id: @doc7, doc7: @doc7.attributes }
    assert_redirected_to tender_doc7_path(@tender, Doc7.last)
  end

  test "should destroy doc7" do
    assert_difference('Doc7.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc7 }
    end

    assert_redirected_to tender_doc7s_path(@tender)
  end
end
