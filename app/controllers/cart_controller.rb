class CartController < ApplicationController
  before_action :initialize_cart

  # def add
  #   @book = Book.find(params[:id])
  #
  #   if request.xhr?
  #     @item = @cart.add(params[:id])
  #     flash.now[:cart_notice] = "Added from AJAX <em>#{@item.book.title}</em>"
  #     render action: 'add_with_ajax'
  #   elsif request.post?
  #     @item = @cart.add(params[:id])
  #     flash[:cart_notice] = "Added from POST #{@item.book.title}"
  #     redirect_to session[:return_to] || { controller: 'catalog' }
  #   else
  #     render
  #   end
  # end

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

  def remove; end

  def clear; end
end
