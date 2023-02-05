class AuthenticationController < ApplicationController
  def create
    @user = User.find_by_phone(session_params[:phone])
    if login(@user, 'auth')
      render json: {
        logged_in: true,
        user: @user.attributes.except('password_digest', 'phone', 'email'),
        message: ['User has logged in successfully'],
        token: login(session_params, 'token')
      }
    else
      render json: {
               message: 'Incorrect username or password'
             },
             status: :unauthorized
    end
  end

  private

  def session_params
    params.permit(:phone, :password)
  end
end
