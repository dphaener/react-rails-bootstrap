class ResolverGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  desc "Creates a graphl resolver"

  def create_model_file
    template "resolver.rb", File.join("app/graphql/resolvers", class_path, "#{file_name}_resolver.rb")
  end

protected

  def parent_class_name
    options[:parent] || "ApplicationResolver"
  end
end
