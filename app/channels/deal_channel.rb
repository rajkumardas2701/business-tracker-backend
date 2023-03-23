class DealChannel < ApplicationCable::Channel
  def subscribed
    # byebug
    stream_from "deals_user_#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
