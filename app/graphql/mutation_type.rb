MutationType = GraphQL::ObjectType.define do
  name 'MutationType'

  field :createUser, field: UserMutations::Create.field
  field :updateUser, field: UserMutations::Update.field
  field :destroyUser, field: UserMutations::Destroy.field
  field :loginUser, field: UserMutations::Login.field

  field :createOrganizationUser, field: OrganizationUserMutations::Create.field
  field :updateOrganizationUser, field: OrganizationUserMutations::Update.field
  field :destroyOrganizationUser, field: OrganizationUserMutations::Destroy.field

  field :createOrganizationAdmin, field: OrganizationAdminMutations::Create.field
  field :updateOrganizationAdmin, field: OrganizationAdminMutations::Update.field
  field :destroyOrganizationAdmin, field: OrganizationAdminMutations::Destroy.field

  field :createOrganization, field: OrganizationMutations::Create.field
  field :updateOrganization, field: OrganizationMutations::Update.field
  field :destroyOrganization, field: OrganizationMutations::Destroy.field

  field :createOrganizationMemberhsip, field: OrganizationMemberhsipMutations::Create.field
  field :updateOrganizationMemberhsip, field: OrganizationMemberhsipMutations::Update.field
  field :destroyOrganizationMemberhsip, field: OrganizationMemberhsipMutations::Destroy.field

  field :createAdminUser, field: AdminUserMutations::Create.field
  field :updateAdminUser, field: AdminUserMutations::Update.field
  field :destroyAdminUser, field: AdminUserMutations::Destroy.field
end
