class CamelCaseInstrumenter
  def instrument(type, field)
    if field.name != 'clientMutationId' && field.resolve_proc.class.name.match(/Name/)
      field.redefine do
        property field.name.underscore
      end
    else
      field
    end
  end
end
