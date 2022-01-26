# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root "remix#proxy"

  # Serve GraphQL API at /api
  scope "/api" do
    # devise_for :users
    post "/", to: "graphql#execute"
    mount GraphiQL::Rails::Engine, at: "/", graphql_path: "/api"
  end

  # Serve Rails Admin at /admin
  mount RailsAdmin::Engine, at: "/admin"

  # Proxy all other requests to Remix
  match "/*path", to: "remix#proxy", via: :all
end
