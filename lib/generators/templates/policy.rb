<% module_namespacing do -%>
class <%= class_name %>Policy < <%= parent_class_name %>
  def create?
    false
  end

  def update?
    false
  end

  def destroy?
    false
  end
end
<% end %>
