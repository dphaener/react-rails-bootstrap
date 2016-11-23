class User < ApplicationRecord
  include Authenticatable
  include Tokenizable

  serialize :facebook_profile, FacebookProfile

  validates :first_name, :last_name, presence: true
end
