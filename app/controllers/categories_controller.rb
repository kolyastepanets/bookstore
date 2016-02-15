class CategoriesController < ApplicationController
  before_action :load_category, only: [:show]

  load_and_authorize_resource

  def show
    @categories = Category.all
    @books = @category.books.page(params[:page]).per(9)
  end

  private

    def load_category
      @category = Category.find(params[:id])
    end
end
