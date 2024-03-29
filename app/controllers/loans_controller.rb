class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :update, :destroy]
  load_and_authorize_resource

  # GET /loans
  def index
    render json: @loans.order(created_at: :asc)
  end

  # GET /loans/1
  def show
    render json: @loan
  end

  # POST /loans
  def create
    if @loan.save
      render json: @loan, status: :created, location: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      render json: @loan
    else
      render json: @loan.errors, status: :unprocessable_entity
    end
  end

  # DELETE /loans/1
  def destroy
    @loan.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:is_active, :user_id, :book_id)
    end
end
