# typed: strict
# frozen_string_literal: true

require "route_constraints"

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
    mount GraphiQL::Rails::Engine, at: :/, graphql_path: "/api/graphql"
  end

  scope :admin, constraints: authenticated(admin_only: true) do
    mount GoodJob::Engine, at: :good_job
    mount RailsAdmin::Engine, at: :/
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
#                                 good_job        /admin/good_job                                                                        GoodJob::Engine
#                              rails_admin        /admin                                                                                 RailsAdmin::Engine
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
