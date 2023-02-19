class Authentication
  def initialize(params)
    @phone = params[:phone]
    @password = params[:password]
  end

  def authenticate(user)
    user&.authenticate(@password)
  end

  def generate_token(user)
    JsonWebToken.encode(user_id: user[:id])
  end
end
