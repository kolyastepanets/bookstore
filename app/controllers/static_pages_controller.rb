class StaticPagesController < ApplicationController
  def home
    @books = Book.all.page(params[:page]).per(1)
    # @author = Author.find(params[:id])
  end
end