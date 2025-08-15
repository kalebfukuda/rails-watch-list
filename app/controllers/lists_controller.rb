class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      # redirect_to lists_path, status: :unprocessable_content
      @lists = List.all
      render :index, status: :unprocessable_entity
    end
  end

  private

  def params_list
    params.require(:list).permit(:name)
  end
end
