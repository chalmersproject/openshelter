# typed: strong

class RailsAdmin::Config::Model
  sig { params(block: T.proc.void.bind(RailsAdmin::Config::HasFields)).void }
  def base(&block); end

  sig { params(block: T.proc.void.bind(RailsAdmin::Config::HasFields)).void }
  def list(&block); end

  sig { params(block: T.proc.void.bind(RailsAdmin::Config::HasFields)).void }
  def edit(&block); end
end

module RailsAdmin::Config::HasFields
  sig do
    params(
      name: Symbol,
      type: T.untyped,
      block: T.proc.void.bind(RailsAdmin::Config::Model),
    ).void
  end
  def configure(name, type = T.unsafe(nil), &block); end

  sig do
    params(
      name: Symbol,
      type: T.untyped,
      add_to_section: T.untyped,
      block: T.proc.void.bind(RailsAdmin::Config::Fields::Base),
    ).void
  end
  def field(
    name,
    type = T.unsafe(nil),
    add_to_section = T.unsafe(nil),
    &block
  ); end
end

class ActiveRecord::Base
  sig { params(block: T.proc.void.bind(RailsAdmin::Config::Model)).void }
  def self.rails_admin(&block); end
end
