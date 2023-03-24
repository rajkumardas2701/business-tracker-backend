class DealsController < ApplicationController
  before_action :authorize_request
  before_action :fetch_deal, except: %i[create index]
  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index
    @deals = sort_deal_by_user
    if @deals
      render json: {
               deals: @deals,
               message: 'Deals fetched successfully'
             },
             status: :ok
    else
      render json: {
               message: @deals.errors.full_messages,
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
      broadcast_to_channel
      render json: {
               deals: sort_deal_by_user,
               message: 'Deal is successfully created'
             },
             status: :ok
    else
      render json: {
               deals: sort_deal_by_user,
               message: @deal.errors.full_messages
             },
             status: 500
    end
    # return unless @deal.valid?

    # broadcast_to_channel
  end

  def update
    if @deal.update(deals_params)
      broadcast_to_channel
      render json: {
               deals: sort_deal_by_user,
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
    # return unless @deal.valid?
    # broadcast_to_channel
  end

  def destroy
    if remove_deal_from_user(@deal)
      broadcast_to_channel
      render json: {
               deals: sort_deal_by_user,
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
    # return unless @deal.valid?
    # broadcast_to_channel
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

  def invalid_foreign_key
    render json: {
             deals: [],
             message: 'Delete associated transactions first'
           },
           status: :unprocessable_entity
  end

  def broadcast_to_channel
    ActionCable.server.broadcast("deals_user_#{current_user}", {
                                   deals: sort_deal_by_user,
                                   message: 'Update received in deal'
                                 })
  end
end
