# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `heya` gem.
# Please instead update this file by running `bin/tapioca gem heya`.

class ActiveRecord::Relation
  include ::Heya::ActiveRecordRelationExtension
  include ::ActiveModel::ForbiddenAttributesProtection
end

# source://heya//lib/heya/version.rb#3
module Heya
  extend ::Heya

  # Returns the value of attribute campaigns.
  #
  # source://heya//lib/heya.rb#19
  def campaigns; end

  # Sets the attribute campaigns
  #
  # @param value the value to set the attribute campaigns to.
  #
  # source://heya//lib/heya.rb#19
  def campaigns=(_arg0); end

  # source://heya//lib/heya.rb#35
  def config; end

  # @yield [config]
  #
  # source://heya//lib/heya.rb#30
  def configure; end

  # @return [Boolean]
  #
  # source://heya//lib/heya.rb#44
  def in_segment?(user, segment); end

  # @return [Boolean]
  #
  # source://heya//lib/heya.rb#39
  def in_segments?(user, *segments); end

  # source://heya//lib/heya.rb#22
  def register_campaign(klass); end

  # source://heya//lib/heya.rb#26
  def unregister_campaign(klass); end

  class << self
    # source://railties/7.0.3.1/lib/rails/engine.rb#405
    def railtie_helpers_paths; end

    # source://railties/7.0.3.1/lib/rails/engine.rb#394
    def railtie_namespace; end

    # source://railties/7.0.3.1/lib/rails/engine.rb#409
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end

    # source://railties/7.0.3.1/lib/rails/engine.rb#397
    def table_name_prefix; end

    # source://railties/7.0.3.1/lib/rails/engine.rb#401
    def use_relative_model_naming?; end
  end
end

# source://heya//lib/heya/active_record_extension.rb#6
module Heya::ActiveRecordRelationExtension
  # source://heya//lib/heya/active_record_extension.rb#9
  def build_arel(aliases = T.unsafe(nil)); end
end

# source://heya//lib/heya/active_record_extension.rb#7
Heya::ActiveRecordRelationExtension::TABLE_REGEXP = T.let(T.unsafe(nil), Regexp)

class Heya::ApplicationController < ::ActionController::Base
  private

  # source://actionview/7.0.3.1/lib/action_view/layouts.rb#328
  def _layout(lookup_context, formats); end

  def _layout_from_proc; end

  class << self
    # source://activesupport/7.0.3.1/lib/active_support/callbacks.rb#68
    def __callbacks; end

    # source://actionpack/7.0.3.1/lib/action_dispatch/routing/route_set.rb#564
    def _routes; end

    # source://actionpack/7.0.3.1/lib/action_controller/metal/params_wrapper.rb#185
    def _wrapper_options; end

    # source://actionpack/7.0.3.1/lib/action_controller/metal/helpers.rb#63
    def helpers_path; end

    # source://actionpack/7.0.3.1/lib/action_controller/metal.rb#210
    def middleware_stack; end
  end
end

module Heya::ApplicationController::HelperMethods
  include ::Loaf::OptionsValidator
  include ::Loaf::ViewExtensions
  include ::Turbo::DriveHelper
  include ::Turbo::FramesHelper
  include ::Turbo::IncludesHelper
  include ::Turbo::StreamsHelper
  include ::Turbo::Streams::ActionHelper
  include ::ActionText::ContentHelper
  include ::ActionText::TagHelper
  include ::Hotwire::Livereload::LivereloadTagsHelper
  include ::ActionController::Base::HelperMethods
  include ::Heya::ApplicationHelper
end

module Heya::ApplicationHelper; end
class Heya::ApplicationJob < ::ActiveJob::Base; end

class Heya::ApplicationMailer < ::ActionMailer::Base
  private

  # source://actionview/7.0.3.1/lib/action_view/layouts.rb#328
  def _layout(lookup_context, formats); end

  class << self
    # source://actionpack/7.0.3.1/lib/action_dispatch/routing/route_set.rb#564
    def _routes; end
  end
end

class Heya::ApplicationRecord < ::ActiveRecord::Base
  include ::Heya::ApplicationRecord::GeneratedAttributeMethods
  include ::Heya::ApplicationRecord::GeneratedAssociationMethods
  include ::Kaminari::ActiveRecordModelExtension
  include ::Kaminari::ConfigurationMethods
  extend ::Kaminari::ConfigurationMethods::ClassMethods

  class << self
    # source://activemodel/7.0.3.1/lib/active_model/validations.rb#52
    def _validators; end

    # source://activerecord/7.0.3.1/lib/active_record/enum.rb#116
    def defined_enums; end

    # source://kaminari-activerecord/1.2.2/lib/kaminari/activerecord/active_record_model_extension.rb#15
    def page(num = T.unsafe(nil)); end
  end
end

module Heya::ApplicationRecord::GeneratedAssociationMethods; end
module Heya::ApplicationRecord::GeneratedAttributeMethods; end

class Heya::CampaignMailer < ::Heya::ApplicationMailer
  def build; end

  protected

  def _prefixes; end
  def attributes_for(user); end
  def to_address(user, step); end

  private

  # source://actionview/7.0.3.1/lib/action_view/layouts.rb#328
  def _layout(lookup_context, formats); end

  def _layout_from_proc; end

  class << self
    # source://actionview/7.0.3.1/lib/action_view/layouts.rb#209
    def _layout; end

    # source://actionview/7.0.3.1/lib/action_view/layouts.rb#210
    def _layout_conditions; end

    # source://actionpack/7.0.3.1/lib/action_dispatch/routing/route_set.rb#564
    def _routes; end

    def email_address_with_name(address, name); end
  end
end

Heya::CampaignMailer::DEFAULT_LAYOUT = T.let(T.unsafe(nil), String)

class Heya::CampaignMembership < ::Heya::ApplicationRecord
  include ::Heya::CampaignMembership::GeneratedAttributeMethods
  include ::Heya::CampaignMembership::GeneratedAssociationMethods

  # source://activerecord/7.0.3.1/lib/active_record/autosave_association.rb#160
  def autosave_associated_records_for_user(*args); end

  class << self
    # source://activesupport/7.0.3.1/lib/active_support/callbacks.rb#68
    def __callbacks; end

    # source://activerecord/7.0.3.1/lib/active_record/reflection.rb#11
    def _reflections; end

    # source://activemodel/7.0.3.1/lib/active_model/validations.rb#52
    def _validators; end

    # source://activerecord/7.0.3.1/lib/active_record/scoping/named.rb#174
    def active(*args, **_arg1); end

    # source://activerecord/7.0.3.1/lib/active_record/enum.rb#116
    def defined_enums; end

    def migrate_next_step!; end

    # source://activerecord/7.0.3.1/lib/active_record/scoping/named.rb#174
    def to_process(*args, **_arg1); end

    # source://activerecord/7.0.3.1/lib/active_record/scoping/named.rb#174
    def upcoming(*args, **_arg1); end

    # source://activerecord/7.0.3.1/lib/active_record/scoping/named.rb#174
    def with_steps(*args, **_arg1); end
  end
end

module Heya::CampaignMembership::GeneratedAssociationMethods
  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/singular_association.rb#19
  def reload_user; end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/association.rb#103
  def user; end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/association.rb#111
  def user=(value); end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/belongs_to.rb#132
  def user_changed?; end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/belongs_to.rb#136
  def user_previously_changed?; end
end

module Heya::CampaignMembership::GeneratedAttributeMethods; end

class Heya::CampaignReceipt < ::Heya::ApplicationRecord
  include ::Heya::CampaignReceipt::GeneratedAttributeMethods
  include ::Heya::CampaignReceipt::GeneratedAssociationMethods

  # source://activerecord/7.0.3.1/lib/active_record/autosave_association.rb#160
  def autosave_associated_records_for_user(*args); end

  class << self
    # source://activesupport/7.0.3.1/lib/active_support/callbacks.rb#68
    def __callbacks; end

    # source://activerecord/7.0.3.1/lib/active_record/reflection.rb#11
    def _reflections; end

    # source://activemodel/7.0.3.1/lib/active_model/validations.rb#52
    def _validators; end

    # source://activerecord/7.0.3.1/lib/active_record/enum.rb#116
    def defined_enums; end
  end
end

module Heya::CampaignReceipt::GeneratedAssociationMethods
  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/singular_association.rb#19
  def reload_user; end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/association.rb#103
  def user; end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/association.rb#111
  def user=(value); end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/belongs_to.rb#132
  def user_changed?; end

  # source://activerecord/7.0.3.1/lib/active_record/associations/builder/belongs_to.rb#136
  def user_previously_changed?; end
end

module Heya::CampaignReceipt::GeneratedAttributeMethods; end

# source://heya//lib/heya/campaigns/action.rb#4
module Heya::Campaigns; end

# source://heya//lib/heya/campaigns/action.rb#5
class Heya::Campaigns::Action
  # @return [Action] a new instance of Action
  #
  # source://heya//lib/heya/campaigns/action.rb#6
  def initialize(user:, step:); end

  # @raise [NotImplementedError]
  #
  # source://heya//lib/heya/campaigns/action.rb#12
  def build; end

  # source://heya//lib/heya/campaigns/action.rb#20
  def deliver_later; end

  # source://heya//lib/heya/campaigns/action.rb#16
  def deliver_now; end

  # Returns the value of attribute step.
  #
  # source://heya//lib/heya/campaigns/action.rb#10
  def step; end

  # Returns the value of attribute user.
  #
  # source://heya//lib/heya/campaigns/action.rb#10
  def user; end
end

# source://heya//lib/heya/campaigns/actions/email.rb#5
module Heya::Campaigns::Actions; end

# source://heya//lib/heya/campaigns/actions/block.rb#6
class Heya::Campaigns::Actions::Block < ::Heya::Campaigns::Action
  # source://heya//lib/heya/campaigns/actions/block.rb#17
  def build; end
end

# source://heya//lib/heya/campaigns/actions/block.rb#7
class Heya::Campaigns::Actions::Block::Execution
  # @return [Execution] a new instance of Execution
  #
  # source://heya//lib/heya/campaigns/actions/block.rb#8
  def initialize(user:, step:, &block); end

  # source://heya//lib/heya/campaigns/actions/block.rb#12
  def deliver; end
end

# source://heya//lib/heya/campaigns/actions/email.rb#6
class Heya::Campaigns::Actions::Email < ::Heya::Campaigns::Action
  # source://heya//lib/heya/campaigns/actions/email.rb#16
  def build; end

  class << self
    # source://heya//lib/heya/campaigns/actions/email.rb#9
    def validate_step(step); end
  end
end

# source://heya//lib/heya/campaigns/actions/email.rb#7
Heya::Campaigns::Actions::Email::VALID_PARAMS = T.let(T.unsafe(nil), Array)

# {Campaigns::Base} provides a Ruby DSL for building campaign sequences.
# Multiple actions are supported; the default is email.
#
# source://heya//lib/heya/campaigns/base.rb#10
class Heya::Campaigns::Base
  include ::Singleton
  include ::GlobalID::Identification
  include ::ActiveSupport::Rescuable
  extend ::ActiveSupport::DescendantsTracker
  extend ::Singleton::SingletonClassMethods
  extend ::ActiveSupport::Rescuable::ClassMethods

  # @return [Base] a new instance of Base
  #
  # source://heya//lib/heya/campaigns/base.rb#17
  def initialize; end

  # source://heya//lib/heya/campaigns/base.rb#77
  def __defaults; end

  # source://heya//lib/heya/campaigns/base.rb#77
  def __defaults=(_arg0); end

  # source://heya//lib/heya/campaigns/base.rb#77
  def __defaults?; end

  # source://heya//lib/heya/campaigns/base.rb#78
  def __segments; end

  # source://heya//lib/heya/campaigns/base.rb#78
  def __segments=(_arg0); end

  # source://heya//lib/heya/campaigns/base.rb#78
  def __segments?; end

  # source://heya//lib/heya/campaigns/base.rb#79
  def __user_type; end

  # source://heya//lib/heya/campaigns/base.rb#79
  def __user_type=(_arg0); end

  # source://heya//lib/heya/campaigns/base.rb#79
  def __user_type?; end

  # source://heya//lib/heya/campaigns/base.rb#29
  def add(user, restart: T.unsafe(nil), concurrent: T.unsafe(nil), send_now: T.unsafe(nil)); end

  # Returns String GlobalID.
  #
  # source://heya//lib/heya/campaigns/base.rb#25
  def gid; end

  # source://heya//lib/heya/campaigns/base.rb#67
  def handle_exception(exception); end

  # source://heya//lib/heya/campaigns/base.rb#21
  def id(*_arg0, **_arg1, &_arg2); end

  # source://heya//lib/heya/campaigns/base.rb#21
  def name(*_arg0, **_arg1, &_arg2); end

  # source://heya//lib/heya/campaigns/base.rb#58
  def remove(user); end

  # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
  def rescue_handlers; end

  # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
  def rescue_handlers=(_arg0); end

  # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
  def rescue_handlers?; end

  # source://heya//lib/heya/campaigns/base.rb#75
  def sanitize_sql_array(*_arg0, **_arg1, &_arg2); end

  # Returns the value of attribute steps.
  #
  # source://heya//lib/heya/campaigns/base.rb#71
  def steps; end

  # Sets the attribute steps
  #
  # @param value the value to set the attribute steps to.
  #
  # source://heya//lib/heya/campaigns/base.rb#71
  def steps=(_arg0); end

  # source://heya//lib/heya/campaigns/base.rb#63
  def user_class; end

  class << self
    # source://heya//lib/heya/campaigns/base.rb#77
    def __defaults; end

    # source://heya//lib/heya/campaigns/base.rb#77
    def __defaults=(value); end

    # source://heya//lib/heya/campaigns/base.rb#77
    def __defaults?; end

    # source://heya//lib/heya/campaigns/base.rb#78
    def __segments; end

    # source://heya//lib/heya/campaigns/base.rb#78
    def __segments=(value); end

    # source://heya//lib/heya/campaigns/base.rb#78
    def __segments?; end

    # source://heya//lib/heya/campaigns/base.rb#79
    def __user_type; end

    # source://heya//lib/heya/campaigns/base.rb#79
    def __user_type=(value); end

    # source://heya//lib/heya/campaigns/base.rb#79
    def __user_type?; end

    # source://heya//lib/heya/campaigns/base.rb#99
    def add(*_arg0, **_arg1, &_arg2); end

    # source://heya//lib/heya/campaigns/base.rb#101
    def default(**params); end

    # source://heya//lib/heya/campaigns/base.rb#95
    def find(_id); end

    # source://heya//lib/heya/campaigns/base.rb#99
    def gid(*_arg0, **_arg1, &_arg2); end

    # source://heya//lib/heya/campaigns/base.rb#99
    def handle_exception(*_arg0, **_arg1, &_arg2); end

    # @private
    #
    # source://heya//lib/heya/campaigns/base.rb#89
    def inherited(campaign); end

    # source://heya//lib/heya/campaigns/base.rb#99
    def remove(*_arg0, **_arg1, &_arg2); end

    # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
    def rescue_handlers; end

    # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
    def rescue_handlers=(value); end

    # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
    def rescue_handlers?; end

    # source://heya//lib/heya/campaigns/base.rb#113
    def segment(arg = T.unsafe(nil), &block); end

    # source://heya//lib/heya/campaigns/base.rb#121
    def step(name, **opts, &block); end

    # source://heya//lib/heya/campaigns/base.rb#99
    def steps(*_arg0, **_arg1, &_arg2); end

    # source://heya//lib/heya/campaigns/base.rb#99
    def user_class(*_arg0, **_arg1, &_arg2); end

    # source://heya//lib/heya/campaigns/base.rb#105
    def user_type(value = T.unsafe(nil)); end
  end
end

# source://heya//lib/heya/campaigns/base.rb#81
Heya::Campaigns::Base::STEP_ATTRS = T.let(T.unsafe(nil), Hash)

# source://heya//lib/heya/campaigns/queries.rb#5
module Heya::Campaigns::Queries; end

# Given a campaign and a user, {Queries::MembershipsForUpdate}
# returns the user's campaign memberships which should be updated
# concurrently.
#
# source://heya//lib/heya/campaigns/queries.rb#15
Heya::Campaigns::Queries::MembershipsForUpdate = T.let(T.unsafe(nil), Proc)

# {Queries::MembershipsToProcess} returns the CampaignMembership records
# which should be processed by the scheduler.
#
# source://heya//lib/heya/campaigns/queries.rb#8
Heya::Campaigns::Queries::MembershipsToProcess = T.let(T.unsafe(nil), Proc)

# Given a campaign, {Queries::OrphanedMemberships} returns the campaign
# memberships which are on steps have been removed from the campaign.
#
# source://heya//lib/heya/campaigns/queries.rb#28
Heya::Campaigns::Queries::OrphanedMemberships = T.let(T.unsafe(nil), Proc)

# {Campaigns::Scheduler} schedules campaign jobs to run for each campaign.
#
# For each step in each campaign:
#   1. Find users who haven't completed step, and are outside the `wait`
#   window
#   2. Match segment
#   3. Create CampaignReceipt (excludes user in subsequent steps)
#   4. Process job
#
# source://heya//lib/heya/campaigns/scheduler.rb#13
class Heya::Campaigns::Scheduler
  # source://heya//lib/heya/campaigns/scheduler.rb#14
  def run(user: T.unsafe(nil)); end

  private

  # source://heya//lib/heya/campaigns/scheduler.rb#36
  def process(campaign, step, user); end
end

# source://heya//lib/heya/campaigns/step.rb#7
class Heya::Campaigns::Step < ::OpenStruct
  include ::GlobalID::Identification

  # @return [Step] a new instance of Step
  #
  # source://heya//lib/heya/campaigns/step.rb#15
  def initialize(id:, name:, campaign:, position:, action:, wait:, segment:, queue:, params: T.unsafe(nil)); end

  # source://heya//lib/heya/campaigns/step.rb#30
  def campaign_name; end

  # source://heya//lib/heya/campaigns/step.rb#22
  def gid; end

  # @return [Boolean]
  #
  # source://heya//lib/heya/campaigns/step.rb#26
  def in_segment?(user); end

  class << self
    # source://heya//lib/heya/campaigns/step.rb#10
    def find(id); end
  end
end

# source://heya//lib/heya/campaigns/step_action_job.rb#5
class Heya::Campaigns::StepActionJob < ::ActiveJob::Base
  # source://heya//lib/heya/campaigns/step_action_job.rb#10
  def perform(_campaign, user, step); end

  private

  # From ActionMailer: "deserialize" the mailer class name by hand in case
  # another argument (like a Global ID reference) raised
  # DeserializationError.
  #
  # source://heya//lib/heya/campaigns/step_action_job.rb#19
  def campaign_class; end

  # source://heya//lib/heya/campaigns/step_action_job.rb#25
  def handle_exception_with_campaign_class(exception); end

  class << self
    # source://activejob/7.0.3.1/lib/active_job/queue_name.rb#56
    def queue_name; end

    # source://activesupport/7.0.3.1/lib/active_support/rescuable.rb#13
    def rescue_handlers; end
  end
end

# source://heya//lib/heya/config.rb#6
class Heya::Config < ::OpenStruct
  # @return [Config] a new instance of Config
  #
  # source://heya//lib/heya/config.rb#7
  def initialize; end
end

# source://heya//lib/heya/engine.rb#4
class Heya::Engine < ::Rails::Engine
  class << self
    # source://activesupport/7.0.3.1/lib/active_support/callbacks.rb#68
    def __callbacks; end
  end
end

# source://heya//lib/heya/version.rb#4
Heya::VERSION = T.let(T.unsafe(nil), String)
