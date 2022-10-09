class CartController < ApplicationController
  before_action :initialize_cart

  def add
    @book = Book.find(params[:id])

    if request.xhr? # if our request is an xml_http_request...
      @item = @cart.add(params[:id])
      flash.now[:cart_notice] = "Added <em>#{@item.book.title}</em>"
      render action: 'add_with_ajax', layout: false
    elsif request.post?
      @item = @cart.add(params[:id])
      flash[:cart_notice] = "Added <em>#{@item.book.title}</em>"
      redirect_to controller: 'catalog'
    else
      render
    end
  end
end
