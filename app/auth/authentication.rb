class Authentication
  def initialize(params)
    @phone = params[:phone]
    @password = params[:password]
  end

  def authenticate(user)
    # return user if user.password_digest == @password
    # byebug
    user&.authenticate(@password)
    # false
  end

  def generate_token(user)
    JsonWebToken.encode(user_id: user[:id])
  end
end
