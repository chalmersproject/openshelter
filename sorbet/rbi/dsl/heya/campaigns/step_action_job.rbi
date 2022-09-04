# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Heya::Campaigns::StepActionJob`.
# Please instead update this file by running `bin/tapioca dsl Heya::Campaigns::StepActionJob`.

class Heya::Campaigns::StepActionJob
  class << self
    sig do
      params(
        _campaign: T.untyped,
        user: T.untyped,
        step: T.untyped
      ).returns(T.any(Heya::Campaigns::StepActionJob, FalseClass))
    end
    def perform_later(_campaign, user, step); end

    sig { params(_campaign: T.untyped, user: T.untyped, step: T.untyped).returns(T.untyped) }
    def perform_now(_campaign, user, step); end
  end
end
