class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: Book.all, status: 200
  end
end