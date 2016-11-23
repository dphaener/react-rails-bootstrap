class GraphQlController < ApplicationController
  def execute
    if Rails.env.development?
      logger.info("#{'-' * 100}\n #{GraphQLFormatter.new(params[:query]).to_s}\n #{'-' * 100}")
    end

    result = RelaySchema.execute(
      params[:query],
      variables: params[:variables],
      context: request_context
    )

    if Rails.env.development?
      logger.info(result)
    end

    render json: result
  end
end
