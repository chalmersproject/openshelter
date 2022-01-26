# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  # Serve GraphQL API at /api/graphql
  post "/api/graphql", to: "graphql#execute"

  # Serve GraphiQL at /api
  mount GraphiQL::Rails::Engine, at: "/api", graphql_path: "/api/graphql"

  # Serve Rails Admin at /admin
  mount RailsAdmin::Engine, at: "/admin" #, as: "rails_admin"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
