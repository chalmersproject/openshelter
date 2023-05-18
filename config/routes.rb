# typed: true
# frozen_string_literal: true

require "constraints"

Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  post "/graphql", to: "graphql#execute"
  # == Healthcheck ==
  Healthcheck.routes(self)

  # == Devise ==
  devise_for :users,
             path: :account,
             skip: :invitations,
             controllers: {
               registrations: "users/registrations",
               omniauth_callbacks: "users/omniauth_callbacks",
             }
  devise_scope :user do
    scope :account, module: :users, as: :user do
      get :/, to: "registrations#show", as: :profile
      resource :invitations, as: :invitation, only: %i[create update] do
        member do
          get :accept, action: :edit
          # get :remove, action: :destroy
        end
      end
      scope "/auth/:provider" do
        resource :omniauth_redirect, path: :redirect, only: %i[show create]
        get "/callback/redirect",
            to: "omniauth_redirects#callback",
            as: :omniauth_callback_redirect
      end
    end
  end

  # == Resources ==
  resources :users, only: :show
  resources :shelters do
    collection do
      # /shelters/my_custom_action
    end
    member do # /shelters/:id/my_custom_action
      get :popup
      get :marker
    end
  end
  resources :shelter_signals, path: "/signals"

  # == Pages ==
  resource :map, only: :show

  # == Frames ==
  scope :frames, module: :frames, only: :show do
    resources :gallery_frames, path: :gallery
  end

  #
  # API key management
  #
  post "/api-keys", to: "api_keys#create"
  delete "/api-keys", to: "api_keys#destroy"
  get "/api-keys", to: "api_keys#index"


  # == Internal ==
  scope :internal do
    scope controller: "internal", as: :internal do
      get :/, action: :index
      scope module: :internal do
        scope :mailer, controller: "mailer", as: :mailer do
          get :/, action: :new
          post :/, action: :create
        end
      end
    end

    # == Engines ==
    authenticate :user, lambda(&:admin?) do
      mount GoodJob::Engine, at: "/good_job"
      mount RailsPgExtras::Web::Engine, at: "/pg_extras"
      # mount Lookbook::Engine, at: "/lookbook" if Rails.env.development?
    end
    scope controller: "high_voltage/pages", action: "show", id: "401" do
      get "/good_job"
      get "/pg_extras"
      # get "/lookbook" if Rails.env.development?
    end
  end
end
