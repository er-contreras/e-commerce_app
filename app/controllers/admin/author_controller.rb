class Admin::AuthorController < ApplicationController
  def index
    # @authors = Author.find(:all)
    @authors = Author.all.order(created_at: :desc)
    @page_title = 'Listing authors'
  end

  def show
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

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

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
