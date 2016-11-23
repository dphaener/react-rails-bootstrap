Rails.application.routes.draw do
  post 'graphql' => 'graph_ql#execute'
end
