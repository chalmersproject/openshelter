# typed: strict
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend T::Sig

  primary_abstract_class

  # == Enumerize ==
  extend Enumerize

  # == Sorbet ==
  # Support runtime type-checking for Sorbet-generated types.
  PrivateRelation = ActiveRecord::Relation
  PrivateRelationWhereChain = ActiveRecord::Relation
  PrivateAssociationRelation = ActiveRecord::AssociationRelation
  PrivateAssociationRelationWhereChain = ActiveRecord::AssociationRelation
  PrivateCollectionProxy = ActiveRecord::Associations::CollectionProxy

  # == Scopes ==
  scope :chronological, -> { order(:created_at) }
  scope :reverse_chronological, -> { order(created_at: :desc) }

  # == Serialization ==
  sig { overridable.returns(T::Hash[String, T.untyped]) }
  def to_hash
    build_hash
  end

  alias_method :to_h, :to_hash

  private

  # == Helpers ==
  sig do
    params(extras: T.nilable(T::Hash[String, T.untyped]), options: T.untyped)
      .returns(T::Hash[String, T.untyped])
  end
  def build_hash(extras = nil, **options)
    hash = serializable_hash(options).with_indifferent_access
    hash.deep_merge!(extras) if extras.present?
    hash.compact_blank!
    hash
  end
end
