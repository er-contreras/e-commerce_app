require "./test/test_helper"

class CartControllerTest < ActionDispatch::IntegrationTest
  def test_adding
    # get "/cart/new"
    # assert_response :success

    assert_difference('CartItem.count') do
      post '/add', params: { id: 1 }
    end

    assert_response :redirect
    assert_redirected_to controller: "catalog"
    assert_equal 1, Cart.find(@request.session[:cart_id]).cart_items.size
  end
end
