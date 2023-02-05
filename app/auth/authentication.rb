class Authentication
  def initialize(user_object)
    @phone = user_object[:phone]
    # byebug
    @password = user_object[:password]
    @user = User.find_by_phone(@phone)
  end

  def authenticate
    !@user&.authenticate(@password)
  end

  def generate_token
    JsonWebToken.encode(user_id: @user.id)
  end
end
