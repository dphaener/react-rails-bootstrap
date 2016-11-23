<% module_namespacing do -%>
class <%= class_name %>Resolver < <%= parent_class_name %>
  class Create < ApplicationResolver::Create
    def self.call(object, inputs, context)

    end
  end

  class Update < ApplicationResolver::Update
    def self.call(object, inputs, context)

    end
  end

  class Destroy < ApplicationResolver::Destroy
    def self.call(object, inputs, context)

    end
  end
end
<% end %>
