class ApplicationPresenter
  include ActionView::Helpers

  attr_reader :record, :context

  def initialize(record, context = nil)
    @record = record
    @context = context
  end

  def ==(other)
    record.id == other.id
  end

  def method_missing(method_name, *args, &block)
    if record.respond_to?(method_name)
      record.send(method_name, *args)
    else
      super(method_name, *args, &block)
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    if record.respond_to?(method_name)
      true
    else
      super(method_name, include_private)
    end
  end
end
