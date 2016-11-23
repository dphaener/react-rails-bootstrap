RootLevelType = GraphQL::ObjectType.define do
  name 'RootLevel'
  description 'Unassociated root object queries'

  interfaces [GraphQL::Relay::Node.interface]

  global_id_field :id
end
