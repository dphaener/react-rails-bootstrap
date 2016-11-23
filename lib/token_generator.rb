module TokenGenerator
  class << self
    def create_signed_token(user)
      JWT.encode({
        user: user.to_token,
      }, ENV['JWT_KEY'], 'HS256')
    end
  end
end
