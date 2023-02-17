class FinancialTransactionsController < ApplicationController
  before_action :authorize_request
  before_action :fetch_transaction, except: %i[create index show_side_transactions]

  def index
    @ft = FinancialTransaction.all
    if @ft
      txs = sort_by_date
      render json: {
               fts: txs,
               message: 'Transactions fetched successfully'
             },
             status: :ok
    else
      render json: {
               message: @ft.errors.full_messages,
               fts: []
             },
             status: 500
    end
  end

  def show_side_transactions
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
               fts: []
             },
             status: 500
    end
  end

  def show; end

  def create
    @tx = FinancialTransaction.new(transactions_params)
    if @tx.save
      txs = sort_by_date
      render json: {
               fts: txs,
               message: 'Transaction is successfully created'
             },
             status: :ok
    else
      render json: {
               fts: [],
               message: @tx.errors.full_messages
             },
             status: 500
    end
  end

  def update
    if @tx.update(transactions_params)
      txs = sort_by_date
      render json: {
               fts: txs,
               message: 'Transaction is successfully updated'
             },
             status: :ok
    else
      render json: {
               fts: [],
               message: @tx.errors.full_messages
             },
             status: 500
    end
  end

  def destroy; end

  private

  def transactions_params
    params.require(:formData).permit(:id,
                                     :date,
                                     :action_by,
                                     :send_receive,
                                     :amount,
                                     :remark,
                                     :user_id,
                                     :deal_id)
  end

  def fetch_transaction
    @tx = FinancialTransaction.find(params[:id])
  end
end
