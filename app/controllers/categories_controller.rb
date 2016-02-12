class CategoriesController < ApplicationController
  before_action :load_category, only: [:show]

  def show
    @categories = Category.all
    @books = @category.books.page(params[:page]).per(9)
  end

  private

    def load_category
      @category = Category.find(params[:id])
    end
end