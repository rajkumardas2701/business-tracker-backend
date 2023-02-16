class FinancialTransactionsController < ApplicationController
  before_action :authorize_request

  def index
    @ft = FinancialTransaction.all
    if @ft
      render json: {
               fts: @ft,
               message: 'Transactions fetched successfully'
             },
             status: :ok
    else
      render json: {
               message: @ft.errors.full_messages,
               fts: {}
             },
             status: 500
    end
  end

  def side_transactions
    stx = FinancialTransaction.new
    @stxs = stx.filter_side_transactions
    if @stxs
      render json: {
               fts: @stxs,
               message: 'Transactions fetched successfully'
             },
             status: :ok
    else
      render json: {
               message: @stxs.errors.full_messages,
               fts: {}
             },
             status: 500
    end
  end

  def show; end

  def create; end

  def update; end

  def destroy; end
end
