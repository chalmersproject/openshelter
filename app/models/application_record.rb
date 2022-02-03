# typed: strict
# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  extend T::Sig

  primary_abstract_class

  # sig { params(block: T.proc.void.bind(RailsAdmin::Config::Model)).void }
  # def self.admin(&block)
  #   super
  # end
end
