class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_book, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to @book
      flash[:alert] = "Before publish your review will be checked by moderator"
    else
      render :new
    end
  end

  private

    def load_book
      @book = Book.find(params[:book_id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :book_id, :value)
    end
end
