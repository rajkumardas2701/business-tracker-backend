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
    FinancialTransaction.order(date: :desc)
  end
end
