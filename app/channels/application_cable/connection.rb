module ApplicationCable
  class Connection < ActionCable::Connection::Base
    # rescue_from StandardError, with: :report_error
    # byebug
    # identified_by :current_user

    # def connect
    #   # byebug
    #   self.current_user = find_verified_user
    # end

    # def find_verified_user
    #   # byebug
    # end

    # private

    # def report_error(e)
    #   # logic here
    # end
  end
end
