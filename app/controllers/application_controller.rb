class ApplicationController < ActionController::API
  include ExceptionHandler
  def authorize_request
    return if logged_in?

    render json: {
             logged_in: false,
             user: {},
             message: 'Please login to continue',
             token: ''
           },
           status: :unauthorized
  end

  def logged_in?
    authorization_object = Authorization.new(request)
    !!authorization_object.current_user
  end

  def login(params, user, type)
    auth_object = Authentication.new(params)
    if type == 'auth'
      auth_object.authenticate(user)
    else
      auth_object.generate_token(user)
    end
  end

  def current_user
    authorization_object = Authorization.new(request)
    authorization_object.current_user
  end

  def set_user
    User.find(current_user)
  end

  def sort_by_date
    set_user.financial_transactions.order(date: :desc)
  end

  def sort_deal_by_user
    set_user.deals.order(updated_at: :desc)
  end

  def remove_deal_from_user(deal)
    deal.update(user_id: nil) if deal.financial_transactions.count.zero?
    deal.delete
  end

  def modify_deal_attributes(deals_params)
    vehicle_date = { vehicle_date: deals_params[:vehicle] + deals_params[:date].gsub(/[^0-9a-zA-Z]/, '') }
    deals_params.merge!(vehicle_date)
    deals_params.merge!(user_id: current_user)
  end
end
