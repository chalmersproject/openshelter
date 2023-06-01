# typed: true
# frozen_string_literal: true

class HeaderNavComponent < ApplicationComponent
  extend T::Sig

  class ItemComponent < ApplicationComponent
    extend T::Sig

    subcomponent

    sig { returns(String) }
    def call
      tag.li(content, class: component_name)
    end

    # == Helpers ==
    sig { params(name: T.any(Symbol, String)).returns(String) }
    def icon(name)
      heroicon(name, class: component_name("icon"), variant: :mini)
    end

    sig { params(text: String).returns(String) }
    def label(text)
      tag.p(text, class: component_name("label"))
    end
  end

  private

  sig { params(block: T.untyped).returns(String) }
  def item(&block)
    render(ItemComponent.new, &block)
  end
end
