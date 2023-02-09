class UsersController < ApplicationController
  before_action :authorize_request, except: :create
  before_action :check_user, only: %i[show update destroy]

  def index
    @users = User.all
    if logged_in?
      if @users
        render json: {
          users: @users
        }
      else
        render json: {
                 status: 404,
                 errors: ['User not found']
               },
               status: 404
      end
    else
      render json: {
               status: 401,
               errors: ['Unauthorized access']
             },
             status: 401
    end
  end

  def show
    if logged_in?
      if @user
        render json: {
                 user: @user.attributes.except('password_digest')
               },
               status: 200
      else
        render json: {
                 status: 404,
                 errors: ['User not found']
               },
               status: 404
      end
    else
      render json: {
               status: 401,
               errors: ['Unauthorized access']
             },
             status: 401
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params, @user, 'auth')
      render json: {
               logged_in: true,
               user: @user.attributes.except('password_digest', 'phone', 'email'),
               message: 'You have successfully signed up to the service',
               token: login(user_params, @user, 'token')
             },
             status: :created
    else
      render json: {
               message: @user.errors.full_messages[0]
             },
             status: 400
    end
  end

  def update
    if @user.update(user_params)
      render json: {
               user: @user.attributes.except('password_digest'),
               status: 200
             },
             status: 200
    else
      render json: {
               errors: @user.errors.full_messages,
               status: :unprocessable_entity
             },
             status: :unprocessable_entity
    end
  end

  def destroy
    user = @user
    if @user.destroy
      render json: {
               status: 200,
               message: `#{user.fullname}'s account has been deleted`
             },
             status: 200
    else
      render json: {
               status: 500,
               message: 'Account deletion failed'
             },
             status: 500
    end
  end

  private

  def check_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone, :email, :password)
  end
end
