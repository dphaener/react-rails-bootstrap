RelaySchema = GraphQL::Schema.define do
  query QueryType
  mutation MutationType

  instrument(:field, CamelCaseInstrumenter.new)

  id_from_object RelayGlobalID::Serializer
  object_from_id RelayGlobalID::DeSerializer
  resolve_type RelayGlobalID::Resolver

  max_depth 10
  max_complexity 200
end

module RelaySchemaHelpers
  def explain
    Rails.cache.fetch checksum do
      RelaySchema.execute GraphQL::Introspection::INTROSPECTION_QUERY
    end
  end

  def checksum
    files   = Dir["app/graphql/**/*.rb"].reject { |f| File.directory?(f) }
    content = files.map { |f| File.read(f) }.join
    Digest::SHA256.hexdigest(content).to_s
  end

  def generate
    FileUtils.mkdir_p SCHEMA_DIR
    result = JSON.pretty_generate(RelaySchema.explain)
    unless File.exist?(SCHEMA_PATH) && File.read(SCHEMA_PATH) == result
      File.write(SCHEMA_PATH, result)
    end
  end

  def remove
    FileUtils.rm SCHEMA_PATH if File.exist? SCHEMA_PATH
  end

  def edge_for_nodes(nodes, node, inputs)
    connection_class = GraphQL::Relay::BaseConnection.connection_for_nodes(nodes)
    connection = connection_class.new(nodes, inputs)
    GraphQL::Relay::Edge.new(node, connection)
  end
end

RelaySchema.extend RelaySchemaHelpers
