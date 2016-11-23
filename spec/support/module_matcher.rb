require 'rspec/expectations'

RSpec::Matchers.define :include_module do |action|
  match do |model|
    model.included_modules.include?(action)
  end

  failure_message do |model|
    "#{model} does not include module #{action}"
  end
end
