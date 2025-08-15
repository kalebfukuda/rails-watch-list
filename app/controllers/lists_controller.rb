class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
    @review = Review.new
    @reviews = @list.reviews
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      @lists = List.all
      @show_modal = true
      render :index, status: :unprocessable_entity
    end
  end

  private

  def params_list
    params.require(:list).permit(:name, :photo)
  end
end
