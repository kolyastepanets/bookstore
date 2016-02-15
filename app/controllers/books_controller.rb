class BooksController < ApplicationController
  before_action :load_book, only: [:show]

  load_and_authorize_resource

  def index
    @books = Book.all.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @reviews = @book.reviews.where(approved: true)
  end

  private

    def load_book
      @book = Book.find(params[:id])
    end
end
