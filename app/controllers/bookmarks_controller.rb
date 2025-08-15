class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new(params_bookmark)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@bookmark.list)
    else
      @show_modal = true
      render 'lists/show', status: :unprocessable_content
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def params_bookmark
    params.require(:bookmark).permit(:comment, :movie_id, :list)
  end
end
