require 'test_helper'

class CanalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @canal = canals(:one)
  end

  test "should get index" do
    get canals_url
    assert_response :success
  end

  test "should get new" do
    get new_canal_url
    assert_response :success
  end

  test "should create canal" do
    assert_difference('Canal.count') do
      post canals_url, params: { canal: {  } }
    end

    assert_redirected_to canal_url(Canal.last)
  end

  test "should show canal" do
    get canal_url(@canal)
    assert_response :success
  end

  test "should get edit" do
    get edit_canal_url(@canal)
    assert_response :success
  end

  test "should update canal" do
    patch canal_url(@canal), params: { canal: {  } }
    assert_redirected_to canal_url(@canal)
  end

  test "should destroy canal" do
    assert_difference('Canal.count', -1) do
      delete canal_url(@canal)
    end

    assert_redirected_to canals_url
  end
end
