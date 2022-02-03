# typed: strict

class Trestle::Engine
  sig { returns(ActionDispatch::Routing::RouteSet) }
  def self.routes(&block); end
end

module Trestle
  sig do
    params(
      name: Symbol,
      options: T.untyped,
      block: T.proc.void.bind(Trestle::Resource::Builder),
    ).void
  end
  def self.admin(name, options = T.unsafe(nil), &block); end

  sig do
    params(
      name: Symbol,
      options: T.untyped,
      block: T.proc.void.bind(Trestle::Resource::Builder),
    ).void
  end
  def self.resource(name, options = T.unsafe(nil), &block); end
end

class Trestle::Admin::Builder
  sig do
    params(
      args: T.untyped,
      block: T.proc.void.bind(Trestle::Navigation::Block::Evaluator),
    ).void
  end
  def menu(*args, &block); end
end

class Trestle::Resource::Builder
  sig do
    params(
      args: T.untyped,
      block: T.proc.void.bind(Trestle::Navigation::Block::Evaluator),
    ).void
  end
  def menu(*args, &block); end

  sig do
    params(
      name_or_options: T.untyped,
      options: T.untyped,
      block: T.proc.void.bind(Trestle::Table::Builder),
    ).void
  end
  def table(
    name_or_options = T.unsafe(nil),
    options = T.unsafe(nil),
    &block
  ); end

  sig do
    params(options: T.untyped, block: T.proc.void.bind(Trestle::Form::Builder))
      .void
  end
  def form(options = T.unsafe(nil), &block); end
end
