require 'test_helper'

class Doc5sControllerTest < ActionController::TestCase
  setup do
    @tender = tenders(:one)
    @doc5 = doc5s(:one)
  end

  test "should get index" do
    get :index, params: { tender_id: @tender }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { tender_id: @tender }
    assert_response :success
  end

  test "should create doc5" do
    assert_difference('Doc5.count') do
      post :create, params: { tender_id: @tender, doc5: @doc5.attributes }
    end

    assert_redirected_to tender_doc5_path(@tender, Doc5.last)
  end

  test "should show doc5" do
    get :show, params: { tender_id: @tender, id: @doc5 }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { tender_id: @tender, id: @doc5 }
    assert_response :success
  end

  test "should update doc5" do
    put :update, params: { tender_id: @tender, id: @doc5, doc5: @doc5.attributes }
    assert_redirected_to tender_doc5_path(@tender, Doc5.last)
  end

  test "should destroy doc5" do
    assert_difference('Doc5.count', -1) do
      delete :destroy, params: { tender_id: @tender, id: @doc5 }
    end

    assert_redirected_to tender_doc5s_path(@tender)
  end
end
