require 'test_helper'

class SiteUserInfosControllerTest < ActionController::TestCase
  setup do
    @site_user_info = site_user_infos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_user_infos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_user_info" do
    assert_difference('SiteUserInfo.count') do
      post :create, :site_user_info => @site_user_info.attributes
    end

    assert_redirected_to site_user_info_path(assigns(:site_user_info))
  end

  test "should show site_user_info" do
    get :show, :id => @site_user_info.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @site_user_info.to_param
    assert_response :success
  end

  test "should update site_user_info" do
    put :update, :id => @site_user_info.to_param, :site_user_info => @site_user_info.attributes
    assert_redirected_to site_user_info_path(assigns(:site_user_info))
  end

  test "should destroy site_user_info" do
    assert_difference('SiteUserInfo.count', -1) do
      delete :destroy, :id => @site_user_info.to_param
    end

    assert_redirected_to site_user_infos_path
  end
end
