require 'test_helper'

class ProductBacklogsControllerTest < ActionController::TestCase
  setup do
    @product_backlog = product_backlogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:product_backlogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product_backlog" do
    assert_difference('ProductBacklog.count') do
      post :create, product_backlog: { description: @product_backlog.description, iteration: @product_backlog.iteration, priority: @product_backlog.priority, reason: @product_backlog.reason, title: @product_backlog.title }
    end

    assert_redirected_to product_backlog_path(assigns(:product_backlog))
  end

  test "should show product_backlog" do
    get :show, id: @product_backlog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product_backlog
    assert_response :success
  end

  test "should update product_backlog" do
    put :update, id: @product_backlog, product_backlog: { description: @product_backlog.description, iteration: @product_backlog.iteration, priority: @product_backlog.priority, reason: @product_backlog.reason, title: @product_backlog.title }
    assert_redirected_to product_backlog_path(assigns(:product_backlog))
  end

  test "should destroy product_backlog" do
    assert_difference('ProductBacklog.count', -1) do
      delete :destroy, id: @product_backlog
    end

    assert_redirected_to product_backlogs_path
  end
end
