# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/api", graphql_path: "/api/graphql"
  post "/api/graphql", to: "graphql#execute"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
