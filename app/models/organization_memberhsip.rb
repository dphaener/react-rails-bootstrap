class OrganizationMemberhsip < ApplicationRecord
  belongs_to :organization
  belongs_to :organization_admin
end
