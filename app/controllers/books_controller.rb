class BooksController < ApplicationController
  before_action :load_book, only: [:show]

  def index
    @books = Book.all.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
  end

  private

    def load_book
      @book = Book.find(params[:id])
    end
end