require 'test_helper'

class Admin::GalleriesControllerTest < ActionController::TestCase
  setup do
    @gallery = galleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    # this is little akward -> result of scaffolding admin module for models
    assert_not_nil assigns(:admin_galleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_gallery" do
    assert_difference('Gallery.count') do
      post :create, gallery: { description: @gallery.description, name: @gallery.name }
    end

    assert_redirected_to gallery_path(assigns(:admin_gallery))
  end

  test "should show admin_gallery" do
    get :show, id: @gallery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gallery
    assert_response :success
  end

  test "should update admin_gallery" do
    patch :update, id: @gallery, gallery: { description: @gallery.description, name: @gallery.name }
    assert_redirected_to gallery_path(assigns(:admin_gallery))
  end

  test "should destroy admin_gallery" do
    assert_difference('Gallery.count', -1) do
      delete :destroy, id: @gallery
    end

    assert_redirected_to galleries_path
  end
end
