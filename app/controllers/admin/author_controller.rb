class Admin::AuthorController < ApplicationController
  def new
    @author = Author.new
    @page_title = 'Create new author'
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      flash[:notice] = "Author #{@author.name} was successfully created."
      redirect_to action: 'index'
    else
      @page_title = 'Create new author'
      render action: 'new'
    end
  end

  def edit; end

  def update; end

  def destroy; end

  def show; end

  def index; end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
