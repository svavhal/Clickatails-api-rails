require 'test_helper'

class SmsTextsControllerTest < ActionController::TestCase
  setup do
    @sms_text = sms_texts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sms_texts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sms_text" do
    assert_difference('SmsText.count') do
      post :create, sms_text: { recipient: @sms_text.recipient, sms_message: @sms_text.sms_message }
    end

    assert_redirected_to sms_text_path(assigns(:sms_text))
  end

  test "should show sms_text" do
    get :show, id: @sms_text
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sms_text
    assert_response :success
  end

  test "should update sms_text" do
    patch :update, id: @sms_text, sms_text: { recipient: @sms_text.recipient, sms_message: @sms_text.sms_message }
    assert_redirected_to sms_text_path(assigns(:sms_text))
  end

  test "should destroy sms_text" do
    assert_difference('SmsText.count', -1) do
      delete :destroy, id: @sms_text
    end

    assert_redirected_to sms_texts_path
  end
end
