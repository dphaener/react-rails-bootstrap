class ApplicationResolver
  def self.get_policy_class
    name.sub("Resolver", "Policy").safe_constantize
  end

  def self.underscore_inputs(inputs)
    inputs.to_h.reduce({}) do |acc, value|
      acc[value[0].underscore] = value[1]
      acc
    end.with_indifferent_access
  end

  def self.authorize(ctx, record, action)
    policy_class = parent.get_policy_class

    if policy_class
      policy = policy_class.new(ctx, record, ctx.brewery)
      raise Pundit::NotAuthorizedError unless policy.public_send(action)
    else
      Rails.logger.info "No policy defined for #{policy_class}, skipping authorization"
    end
  end

  class Create
    def self.authorize(ctx, record)
      policy_class = parent.get_policy_class

      if policy_class
        policy = policy_class.new(ctx, record, ctx.brewery)
        raise Pundit::NotAuthorizedError unless policy.create?
      else
        Rails.logger.info "No policy defined for #{policy_class}, skipping authorization"
      end
    end
  end

  class Update
    def self.authorize(ctx, record)
      policy_class = parent.get_policy_class

      if policy_class
        policy = policy_class.new(ctx, record, ctx.brewery)
        raise Pundit::NotAuthorizedError unless policy.update?
      else
        Rails.logger.info "No policy defined for #{policy_class}, skipping authorization"
      end
    end
  end

  class Destroy
    def self.authorize(ctx, record)
      policy_class = parent.get_policy_class

      if policy_class
        policy = policy_class.new(ctx, record, ctx.brewery)
        raise Pundit::NotAuthorizedError unless policy.destroy?
      else
        Rails.logger.info "No policy defined for #{policy_class}, skipping authorization"
      end
    end
  end

  DEFAULT_DECORATOR = "Presenter".freeze

  attr_reader :relation_name, :collection_name, :model_name, :presenter_name,
              :decorator

  def initialize(relation_name = nil, decorator = nil)
    @model_name = get_model_name
    @relation_name = (relation_name || get_singular_relation_name).to_s
    @collection_name = get_collection_name
    @decorator = decorator || DEFAULT_DECORATOR
    @presenter_name = get_presenter_name
  end

  def call(obj, _args, _ctx)
    record = obj.public_send(relation_name.to_sym)
    presenter = presenter_name.safe_constantize

    return presenter.new(record) if presenter

    Rails.logger.debug "Presenter #{presenter_name} not found. Perhaps you mistyped it? Defaulting to plain model."
    record
  end

  def collection
    proc do |obj, _args, _ctx|
      records = obj.public_send(collection_name)
      presenter = presenter_name.safe_constantize

      return records.map { |r| presenter.new(r) } if presenter
      records
    end
  end

private

  def get_model_name
    self.class.name.sub("Resolver", "")
  end

  def get_collection_name
    relation_name.pluralize
  end

  def get_singular_relation_name
    model_name.tableize.singularize
  end

  def get_presenter_name
    "#{model_name}#{decorator}"
  end
end
