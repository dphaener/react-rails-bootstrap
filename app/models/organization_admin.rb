class OrganizationAdmin < ApplicationRecord
  include Authenticatable

  belongs_to :organization
end
