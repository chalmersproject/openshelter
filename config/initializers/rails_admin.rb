# rubocop:disable Layout/LineLength
# typed: false
# frozen_string_literal: true

RailsAdmin.config do |config|
  # Serve via Sprockets.
  config.asset_source = :sprockets

  # Customizations:
  config.main_app_name = ["Chalmers Admin", ""]

  # Actions:
  config.actions do
    dashboard # mandatory
    index # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    root :good_job do
      show_in_menu false
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == CancanCan ==
  # config.authorize_with :cancancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  config.show_gravatar = true
end
