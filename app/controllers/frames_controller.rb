# typed: strict
# frozen_string_literal: true

class FramesController < ApplicationController
  extend T::Sig

  sig { params(args: T.untyped).void }
  def initialize(*args)
    super
    @frame = T.let(@frame, T.nilable(ApplicationFrame))
    @component = T.let(@component, T.nilable(ApplicationComponent))
  end

  before_action :set_frame
  layout "frame"

  # == Actions ==
  sig { void }
  def show
    @frame = T.must(@frame)
    @component = @frame.to_component
  end

  private

  sig { overridable.void }
  def set_frame
    @frame = controller_name.classify.constantize.new(options: params) # rubocop:disable Sorbet/ConstantsFromStrings
  end
end
