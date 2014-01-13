require 'test_helper'

class PagetextsControllerTest < ActionController::TestCase
  setup do
    @pagetext = pagetexts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pagetexts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pagetext" do
    assert_difference('Pagetext.count') do
      post :create, pagetext: { text: @pagetext.text }
    end

    assert_redirected_to pagetext_path(assigns(:pagetext))
  end

  test "should show pagetext" do
    get :show, id: @pagetext
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pagetext
    assert_response :success
  end

  test "should update pagetext" do
    put :update, id: @pagetext, pagetext: { text: @pagetext.text }
    assert_redirected_to pagetext_path(assigns(:pagetext))
  end

  test "should destroy pagetext" do
    assert_difference('Pagetext.count', -1) do
      delete :destroy, id: @pagetext
    end

    assert_redirected_to pagetexts_path
  end
end
