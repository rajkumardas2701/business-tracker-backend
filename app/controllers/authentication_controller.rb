class AuthenticationController < ApplicationController
  def create
    @user = user_by_phone
    if @user && login(@user, 'auth')
      render json: {
               logged_in: true,
               user: @user.attributes.except('password_digest', 'phone', 'email'),
               message: 'User has logged in successfully',
               token: login(session_params, 'token')
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
    # byebug
    params.require(:user).permit(:phone, :password)
  end

  def user_by_phone
    User.find_by_phone(session_params[:phone])
  end
end
