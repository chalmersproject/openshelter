# typed: strict
# frozen_string_literal: true

require "route_constraints"

# Register application routes.
Rails.application.routes.draw do
  scope :api do
    scope format: false, defaults: { format: :json } do
      get :meta, to: "meta#show"
      post :graphql, to: "graphql#execute"
      scope :auth, controller: :auth do
        post :login
        post :logout
      end
    end
    mount GraphiQL::Rails::Engine, at: "/", graphql_path: "/api/graphql"
  end

  scope :admin do
    constraints authenticated(:admin) do
      mount GoodJob::Engine, at: "/good_job/embed"
      mount Trestle::Engine, at: "/"
      get "/*splat", to: redirect("/admin")
    end
    constraints authenticated(false) do
      get "/", to: "auth#show"
      get "/*splat", to: "auth#show"
    end
  end
end

# Register resource admins routes.
#
# TODO: See if https://github.com/TrestleAdmin/trestle/issues/93 is ever
# resolved.
Trestle::Engine.routes.draw do
  Trestle.registry.each do |admin|
    next unless admin.ancestors.include?(Trestle::Resource)
    resources admin.admin_name,
              only: %i[new edit],
              module: admin.route_name,
              controller: "admin"
  end
end

# rubocop:disable Layout/LineLength

# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                            Controller#Action
#                                     meta GET    /api/meta                                                                              meta#show {:format=>:json}
#                                  graphql POST   /api/graphql                                                                           graphql#execute {:format=>:json}
#                                    login POST   /api/auth/login                                                                        auth#login {:format=>:json}
#                                   logout POST   /api/auth/logout                                                                       auth#logout {:format=>:json}
#                           graphiql_rails        /api                                                                                   GraphiQL::Rails::Engine {:graphql_path=>"/api/graphql"}
#                                 good_job        /admin/good_job/embed                                                                  GoodJob::Engine
#                                  trestle        /admin                                                                                 Trestle::Engine
#                                                 /admin(.:format)                                                                       auth#show
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
# Routes for GoodJob::Engine:
#               root GET    /                                   good_job/executions#index
#          execution DELETE /executions/:id(.:format)           good_job/executions#destroy
#        discard_job PUT    /jobs/:id/discard(.:format)         good_job/jobs#discard
#     reschedule_job PUT    /jobs/:id/reschedule(.:format)      good_job/jobs#reschedule
#          retry_job PUT    /jobs/:id/retry(.:format)           good_job/jobs#retry
#               jobs GET    /jobs(.:format)                     good_job/jobs#index
#                job GET    /jobs/:id(.:format)                 good_job/jobs#show
# enqueue_cron_entry POST   /cron_entries/:id/enqueue(.:format) good_job/cron_entries#enqueue
#       cron_entries GET    /cron_entries(.:format)             good_job/cron_entries#index
#         cron_entry GET    /cron_entries/:id(.:format)         good_job/cron_entries#show
#          processes GET    /processes(.:format)                good_job/processes#index
#          bootstrap GET    /bootstrap(.:format)                good_job/assets#bootstrap_css {:format=>:css}
#              style GET    /style(.:format)                    good_job/assets#style_css {:format=>:css}
#                    GET    /bootstrap(.:format)                good_job/assets#bootstrap_js {:format=>:js}
#          rails_ujs GET    /rails_ujs(.:format)                good_job/assets#rails_ujs_js {:format=>:js}
#            chartjs GET    /chartjs(.:format)                  good_job/assets#chartjs_js {:format=>:js}
#            scripts GET    /scripts(.:format)                  good_job/assets#scripts_js {:format=>:js}
#
# Routes for Trestle::Engine:
#          new_shelter GET    /shelters/new(.:format)      shelters_admin/admin#new
#         edit_shelter GET    /shelters/:id/edit(.:format) shelters_admin/admin#edit
#             new_user GET    /users/new(.:format)         users_admin/admin#new
#            edit_user GET    /users/:id/edit(.:format)    users_admin/admin#edit
#      dashboard_admin GET    /dashboard(.:format)         dashboard_admin/admin#index
#       good_job_admin GET    /good_job(.:format)          good_job_admin/admin#index
# shelters_admin_index GET    /shelters(.:format)          shelters_admin/admin#index
#                      POST   /shelters(.:format)          shelters_admin/admin#create
#       shelters_admin GET    /shelters/:id(.:format)      shelters_admin/admin#show
#                      PATCH  /shelters/:id(.:format)      shelters_admin/admin#update
#                      PUT    /shelters/:id(.:format)      shelters_admin/admin#update
#                      DELETE /shelters/:id(.:format)      shelters_admin/admin#destroy
#    users_admin_index GET    /users(.:format)             users_admin/admin#index
#                      POST   /users(.:format)             users_admin/admin#create
#          users_admin GET    /users/:id(.:format)         users_admin/admin#show
#                      PATCH  /users/:id(.:format)         users_admin/admin#update
#                      PUT    /users/:id(.:format)         users_admin/admin#update
#                      DELETE /users/:id(.:format)         users_admin/admin#destroy
#                 root GET    /                            trestle/dashboard#index
