class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, :only => PUBLIC_ACTIONS
  skip_authorization_check :only => PUBLIC_ACTIONS
  load_and_authorize_resource

  # GET /books
  def index
    @books = params[:search] ? Book.search(params[:search]) : Book.all

    render json: @books
  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  # GET /books/out_of_stock
  def out_of_stock
    render json: Book
          .select("books.*, COUNT(loans.id) as active_loan_count")
          .joins(:loans)
          .merge(Loan.active)
          .group('books.id')
          .having('active_loan_count >= books.quantity')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :quantity, :author_id)
    end
end
