class PresenterGenerator < ::Rails::Generators::NamedBase
  source_root File.expand_path(File.join(File.dirname(__FILE__), 'templates'))

  desc "Creates a presenter for a model"

  def create_model_file
    template "presenter.rb", File.join("app/presenters", class_path, "#{file_name}_presenter.rb")
  end

protected

  def parent_class_name
    options[:parent] || "ApplicationPresenter"
  end
end
