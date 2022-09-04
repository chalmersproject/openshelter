# typed: strict
# frozen_string_literal: true

class FrameComponent < ApplicationComponent
  extend T::Sig

  sig { params(frame: ApplicationFrame, kwargs: T.untyped).void }
  def initialize(frame:, **kwargs)
    super(**kwargs)
    @frame = T.let(frame, ApplicationFrame)
  end

  private

  sig { returns(ApplicationFrame) }
  attr_reader :frame
end
