class DealsController < ApplicationController
  before_action :authorize_request
  before_action :fetch_deal, except: %i[create index]
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @deals = Deal.all
    if @deals
      render json: {
               deals: @deals,
               message: 'Deals fetched successfully'
             },
             status: :ok
    else
      render json: {
               message: @deal.errors.full_messages,
               deals: []
             },
             status: 500
    end
  end

  def show
    if @deal
      render json: {
               deals: @deal,
               message: 'Deals fetched successfully'
             },
             status: :ok
    else
      render json: {
               deals: [],
               message: 'Deal does not exist'
             },
             status: 404
    end
  end

  def create
    @deal = Deal.new(modify_deal_attributes(deals_params).except(:vehicle, :date))
    if @deal.save
      render json: {
               deals: Deal.all,
               message: 'Deal is successfully created'
             },
             status: :ok
    else
      render json: {
               deals: [],
               message: @deal.errors.full_messages
             },
             status: 500
    end
  end

  def update
    if @deal.update(deals_params)
      render json: {
               deals: Deal.all,
               message: 'Deal is updated'
             },
             status: :ok
    else
      render json: {
               deals: [],
               message: @deal.errors.full_messages
             },
             status: 500
    end
  end

  def destroy
    if @deal.delete
      render json: {
               deals: Deal.all,
               message: 'Deal is successfully deleted'
             },
             status: :ok
    else
      render json: {
               deals: [],
               message: @deal.errors.full_messages
             },
             status: 500
    end
  end

  private

  def deals_params
    params.require(:formData).permit(:id,
                                     :vehicle,
                                     :date,
                                     :f_name,
                                     :f_quantiy,
                                     :f_choot,
                                     :f_rate,
                                     :d_name,
                                     :d_quantity,
                                     :d_choot,
                                     :d_rate,
                                     :vehicle_fare,
                                     :labour_charge,
                                     :vehicle_date)
  end

  def fetch_deal
    @deal = Deal.find(params[:id])
  end

  def modify_deal_attributes(deals_params)
    vehicle_date = { vehicle_date: deals_params[:vehicle] + deals_params[:date].gsub(/[^0-9a-zA-Z]/, '') }
    deals_params.merge!(vehicle_date)
  end

  def invalid_foreign_key
    render json: {
             deals: [],
             message: 'Delete associated Transactions first'
           },
           status: :unprocessable_entity
  end
end
