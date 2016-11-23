class ApplicationController < ActionController::API
  include Pundit

  before_action :authenticate_request

  def request_context
    {
      request: request
    }
  end

  def authenticate_request
    return true if request.referrer =~ /graphiql/ && Rails.env.development?
    return false unless request.headers["Authorization"]

    auth_type, token = request.headers["Authorization"].split(" ")

    return false unless auth_type == "Bearer" && token
    return true if Rails.env.development? && token == ENV["INTROSPECTION_TOKEN"]

    auth = JWT.decode(token, ENV["JWT_KEY"], true, { algorithm: "HS256" }).first
    @user = User.find(auth["user"]["id"])
  end
end
