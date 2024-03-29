# typed: true
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  class << self
    extend T::Sig

    private

    # == Helpers ==
    sig { params(column_names: T.any(Symbol, String)).void }
    def requires_columns(*column_names)

      #
      # These checks are for ensuring all required columns for each model are
      # present in the db
      # These checks only run in server or console context
      #
      unless Rails.const_defined?(:Server) || Rails.const_defined?(:Console)
        return
      end
      
      return unless Rails.server? || Rails.console?
      
      Kernel.suppress(ActiveRecord::ConnectionNotEstablished) do
        missing_columns = column_names.map(&:to_s) - self.column_names
        if missing_columns.present?
          subject = if missing_columns.count == 1
            "column `#{missing_columns.first}'"
          else
            missing_columns_sentence =
              missing_columns.map { |name| "`#{name}'" }.to_sentence
            "columns #{missing_columns_sentence}"
          end
          raise "Missing #{subject} on #{model_name}"
        end
      end
    end
  end
end

class ApplicationRecord
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
