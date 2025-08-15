class ReviewsController < ApplicationController
  def create
    @review = Review.new(params_review)
    @list = List.find(params[:list_id])
    @review.list = @list
    @reviews = @list.reviews
    if @review.save
      redirect_to list_path(@review.list)
    else
      @show_modal_review = true
      @bookmark = Bookmark.new
      render 'lists/show', status: :unprocessable_content
    end
  end

  private

  def params_review
    params.require(:review).permit(:comment, :rating)
  end
end
