class ApplicationController < ActionController::API
  include ExceptionHandler
  def authorize_request
    return if logged_in?

    render json: {
             message: 'Please log in'
           },
           status: :unauthorized
  end

  def logged_in?
    authorization_object = Authorization.new(request)
    !!authorization_object.current_user
  end

  def login(user, type)
    auth_object = Authentication.new(user)
    # byebug
    if type == 'auth'
      auth_object.authenticate
    else
      auth_object.generate_token
    end
  end

  def current_user
    authorization_object = Authorization.new(request)
    authorization_object.current_user
  end

  def set_user
    User.find(current_user)
  end
end
