module Authenticatable
  extend ActiveSupport::Concern

  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i

  included do
    has_secure_password validations: false

    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

    def self.authenticate!(params = {})
      # Authenticate with facebook profile if given
      if params[:facebook_profile]
        return false unless user = find_by_email(params[:facebook_profile][:email])
        return false unless user.facebook_profile.id == params[:facebook_profile][:id]
      else
        return false unless user = find_by_email(params[:email])
        return false unless user.authenticate(params[:password])
      end

      user.last_login_at = Time.zone.now
      user.last_login_ip = params.fetch(:ip, nil)
      user.last_login_agent = params.fetch(:agent, nil)
      user.login_count += 1
      user.save
      user
    end
  end
end
