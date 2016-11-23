QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :node, GraphQL::Relay::Node.field

  field :root, RootLevelType do
    resolve ->(_obj, _args, _ctx) { RootLevel::STATIC }
  end
end
