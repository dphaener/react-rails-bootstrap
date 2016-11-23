module Tokenizable
  extend ActiveSupport::Concern

  included do
    def to_token
      {
        email: email,
        id: id,
        login_count: login_count,
        first_name: first_name,
        last_name: last_name
      }   
    end
  end
end
