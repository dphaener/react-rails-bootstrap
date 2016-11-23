class ServiceGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  desc "Creates a create, update, and destroy services for a model"

  def create_model_file
    template "create_service.rb", File.join("app/services", class_path, "#{file_name}_builder.rb")
    template "update_service.rb", File.join("app/services", class_path, "#{file_name}_updater.rb")
  end

protected

  def parent_class_name
    options[:parent] || "ApplicationService"
  end
end
