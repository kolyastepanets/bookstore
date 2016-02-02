class StaticPagesController < ApplicationController
  def home
    @books = Book.bestsellers
  end
end