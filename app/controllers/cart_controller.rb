class CartController < ApplicationController
  before_action :initialize_cart

  # def add
  #   # binding.pry
  #
  #   logger.debug "is it a xml_html_request? #{request.xhr?}\n #{request}" if request
  #   logger.debug "is it a post request? #{request.post?}\n #{request}" if request
  #
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

  # def add
  #   @book = Book.new(book_params)
  #
  #   respond_to do |format|
  #     @book.save
  #     format.js
  #   end
  # end
  #
  # private
  #
  # def book_params
  #   params.permit(:id)
  # end
end
