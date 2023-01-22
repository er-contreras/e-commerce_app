class CartController < ApplicationController
  before_action :initialize_cart

  def add
    @book = Book.find(params[:id])
    @item = @cart.add(params[:id])

    respond_to do |format|
      flash[:cart_notice] = "Book added #{@item.book.title}"
      # The ajax request could respond with an html
      format.html { redirect_to catalog_index_path }
      # format.js
    end
  end

  def remove
    @book = Book.find(params[:id])
    @item = @cart.remove(params[:id])

    respond_to do |format|
      flash[:cart_notice] = "Book removed #{@item.book.title}"
      # The ajax request could respond with an html
      format.html { redirect_to catalog_index_path }
      # format.js
    end
  end

  def clear
    @cart.cart_items.destroy_all
    respond_to do |format|
      flash[:cart_notice] = 'Cleared the cart'
      format.html { redirect_to catalog_index_path }
    end
  end
end
