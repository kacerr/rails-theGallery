require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  setup do
    @gallery = galleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galleries)
  end

=begin
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery" do
    assert_difference('Gallery.count') do
      post :create, gallery: { author: @gallery.author, description: @gallery.description, name: @gallery.name }
    end

    assert_redirected_to gallery_path(assigns(:gallery))
  end


  test "should get edit" do
    get :edit, id: @gallery
    assert_response :success
  end

  test "should update gallery" do
    patch :update, id: @gallery, gallery: { author: @gallery.author, description: @gallery.description, name: @gallery.name }
    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should destroy gallery" do
    assert_difference('Gallery.count', -1) do
      delete :destroy, id: @gallery
    end

    assert_redirected_to galleries_path
  end
=end

  test "should show gallery" do
    get :show, id: @gallery
    assert_response :success
  end

end
