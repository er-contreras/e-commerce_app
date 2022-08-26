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

    assert_response :success
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end
end
