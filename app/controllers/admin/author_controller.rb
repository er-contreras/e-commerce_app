class Admin::AuthorController < ApplicationController
  def index
    @authors = Author.all
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

  def edit
    @author = Author.find(params[:id])
    @page_title = 'Edit author'
  end

  def update
    # raise params.inspect
    @author = Author.find(params[:id])

    # author_params == first_name: params[:author][:first_name], last_name: params[:author][:last_name]
    if @author.update(author_params)
      flash[:notice] = 'Author was successfully updated.'
      redirect_to action: 'show', id: @author
    else
      @page_title = 'Edit author'
      render action: 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    flash[:notice] = "Successfully deleted author #{@author.name}"
    @author.destroy
    redirect_to action: 'index'
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
