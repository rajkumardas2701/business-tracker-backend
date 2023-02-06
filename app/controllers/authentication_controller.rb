class AuthenticationController < ApplicationController
  def create
    @user = set_user
    if @user && login(session_params, @user, 'auth')
      render json: {
               logged_in: true,
               user: @user.attributes.except('password_digest', 'phone', 'email'),
               message: 'User has logged in successfully',
               token: login(session_params, @user, 'token')
             },
             status: :ok
    else
      render json: {
               logged_in: false,
               user: {},
               message: 'Incorrect username or password',
               token: ''
             },
             status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:user).permit(:phone, :password)
  end

  def set_user
    User.find_by(phone: session_params[:phone])
  end
end
