class PolicyGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  desc "Creates a pundit policy"

  def create_model_file
    template "policy.rb", File.join("app/policies", class_path, "#{file_name}_policy.rb")
  end

protected

  def parent_class_name
    options[:parent] || "ApplicationPolicy"
  end
end
