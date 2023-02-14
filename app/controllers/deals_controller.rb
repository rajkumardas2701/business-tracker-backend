class DealsController < ApplicationController
  # before_action :authorize_request
  before_action :fetch_deal, except: :create

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
        deals: {}
      },
      status: 500
    end
  end

  def show
    if @deal
      render json: {
               deal: @deal,
               message: 'Deals fetched successfully'
             },
             status: :ok
    else
      render json: {
               deal: {},
               message: 'Deal does not exist'
             },
             status: 404
    end
  end

  def create
    @deal = Deal.new(modify_deal_attributes(jobs_params).except(:vehicle, :date))
    if @deal.save
      render json: {
               deal: @deal,
               message: 'Deal is successfully created'
             },
             status: :ok
    else
      render json: {
               deal: {},
               message: @deal.errors.full_messages
             },
             status: 500
    end
  end

  def update; end

  def destroy; end

  private

  def jobs_params
    params.permit(:vehicle,
                  :date,
                  :f_name,
                  :f_quantiy,
                  :f_choot,
                  :f_rate,
                  :d_name,
                  :d_quantity,
                  :d_choot,
                  :d_rate,
                  :f_actual_amount,
                  :d_actual_amount)
  end

  def fetch_deal
    @deal = Deal.find_by(id: jobs_params[:id])
  end

  def modify_deal_attributes(jobs_params)
    vehicle_date = { vehicle_date: jobs_params[:vehicle] + jobs_params[:date].gsub(/[^0-9a-zA-Z]/, '') }
    jobs_params.merge!(vehicle_date)
  end
end
