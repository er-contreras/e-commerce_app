require './test/test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  def test_adding
    assert_difference('CartItem.count') do
      post '/add', params: { id: 1 }
    end

    assert_response :redirect
    assert_redirected_to controller: 'catalog'
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end

  def test_adding_with_xhr
    assert_difference('CartItem.count') do
      post '/add', params: { id: 1 }, xhr: true
    end

    assert_redirected_to catalog_index_path
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end

  def test_removing
    post '/add', params: { id: 1 }
    assert_equal [Book.find(1)], Cart.find(@request.session[:cart_id]).books

    delete '/add', params: { id: 1 }
    assert_equal [], Cart.find(@request.session[:cart_id]).books
  end

  def test_removing_with_xhr
    post '/add', params: { id: 1 }, xhr: true
    assert_equal [Book.find(1)], Cart.find(@request.session[:cart_id]).books

    delete '/add', params: { id: 1 }
    assert_equal [], Cart.find(@request.session[:cart_id]).books
  end

  def test_clearing
    post add_path, params: { id: 1 }
    assert_equal [Book.find(1)], Cart.find(@request.session[:cart_id]).books

    post :clear
    assert_response :redirect
    assert_redirected_to catalog_index_path
    assert_equal [], Cart.find(@request.session[:cart_id]).books
  end

  def test_clearing_with_xhr
    post add_path, params: { id: 1 }
    assert_equal [Book.find(1)], Cart.find(@request.session[:cart_id]).books

    post :clear, xhr: true
    assert_response :success
    assert_equal 0, Cart.find(@request.session[:card_id]).cart_items.size
  end
end
