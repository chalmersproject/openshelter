# typed: strict
# frozen_string_literal: true

Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  scope :api, defaults: { format: :json }, format: false do
    get :meta, to: "meta#show"
    post :graphql, to: "graphql#execute"
    scope :auth, controller: :auth do
      # get :csrf
      post :login
      post :logout
    end
    mount GraphiQL::Rails::Engine,
          at: "/",
          graphql_path: "/api/graphql",
          as: :graphiql
  end

  # Administrate with Rails Admin.
  mount RailsAdmin::Engine, at: :admin, as: :admin
end

# rubocop:disable Layout/LineLength

# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                            Controller#Action
#                                  graphql POST   /graphql(.:format)                                                                     graphql#execute
#                                     meta GET    /api/meta                                                                              meta#show {:format=>:json}
#                                          POST   /api/graphql                                                                           graphql#execute {:format=>:json}
#                                    login POST   /api/auth/login                                                                        auth#login {:format=>:json}
#                                   logout POST   /api/auth/logout                                                                       auth#logout {:format=>:json}
#                                 graphiql        /api                                                                                   GraphiQL::Rails::Engine {:format=>:json, :graphql_path=>"/api/graphql"}
#                                    admin        /admin                                                                                 RailsAdmin::Engine
#                       rails_service_blob GET    /api/files/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /api/files/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /api/files/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /api/files/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /api/files/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /api/files/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /api/files/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /api/files/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /api/files/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
#
# Routes for GraphiQL::Rails::Engine:
#        GET  /           graphiql/rails/editors#show
#
# Routes for RailsAdmin::Engine:
#   dashboard GET         /                                      rails_admin/main#dashboard
#       index GET|POST    /:model_name(.:format)                 rails_admin/main#index
#         new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
#      export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
# bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
# bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
#        show GET         /:model_name/:id(.:format)             rails_admin/main#show
#        edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
#      delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
# show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
