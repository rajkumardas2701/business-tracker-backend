module ExceptionHandler
  extend ActiveSupport::Concern

  class DecodeError < StandardError; end

  class ExpiredSignature < StandardError; end

  included do
    rescue_from ExceptionHandler::DecodeError do |_error|
      render json: {
        logged_in: false,
        user: {},
        message: 'Access denied as Invalid token supplied. Please login again',
        token: ''
      }, status: :unauthorized
    end

    rescue_from ExceptionHandler::ExpiredSignature do |_error|
      render json: {
        logged_in: false,
        user: {},
        message: 'Access denied as Token has expired. Please login again',
        token: ''
      }, status: :unauthorized
    end
  end
end
