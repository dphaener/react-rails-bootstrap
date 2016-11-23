class GraphqlResourceGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
  argument :attributes, :type => :array, :default => [], :banner => "field[:type][:index] field[:type][:index]"

  desc "Scaffolds a GraphQL Resource"

  def create_model
    invoke 'active_record:model', options[:attributes]
  end

  def create_resolver
    invoke 'resolver', options[:attributes]
  end

  def create_presenter
    invoke 'presenter', options[:attributes]
  end

  def create_policy
    invoke 'policy', options[:attributes]
  end

  def create_services
    if yes? "Create create and update service objects? (y/n)"
      invoke 'service', options[:attributes]
    end
  end

  def create_schema
    if yes? "Would you like to run the migration and generate the schema right now? (y/n)"
      run 'rails db:migrate'
      invoke 'graphql', options[:attributes]
    end
  end
end
