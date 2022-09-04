# typed: strict
# frozen_string_literal: true

class MenuComponent < ApplicationComponent
  extend T::Sig

  class TriggerComponent < ApplicationComponent
    extend T::Sig

    subcomponent

    sig { params(args: T.untyped, kwargs: T.untyped).void }
    def initialize(*args, **kwargs)
      super(**kwargs)
      @args = args
    end

    sig { returns(String) }
    def call
      tag.button(
        content,
        *@args,
        type: "button",
        data: {
          action:
            token_list(
              "menu-component#toggle",
              "click@window->menu-component#hide",
            ),
        },
        class: class_names(component_name, "w-full", other_classes),
      )
    end
  end

  class ItemComponent < ApplicationComponent
    extend T::Sig

    subcomponent

    sig do
      params(
        args: T.untyped,
        link: T.untyped,
        link_options: T::Hash[Symbol, T.untyped],
        kwargs: T.untyped,
      ).void
    end
    def initialize(*args, link: nil, link_options: {}, **kwargs)
      super(**kwargs)
      @args = args
      @link = link
      @external_link =
        T.let(link_options.delete(:external) || false, T::Boolean)
      @link_options = link_options
    end

    sig { returns(String) }
    def call
      tag.li(
        *@args,
        class: class_names(component_name, "group", other_classes),
        data: {
          action: "click->menu#toggle",
        },
      ) do
        if link?
          if external_link?
            external_link_to(content, link, link_options)
          else
            link_to(content, link, link_options)
          end
        else
          content
        end
      end
    end

    sig { params(name: T.any(Symbol, String)).returns(String) }
    def icon(name)
      heroicon(name, class: component_name("icon"))
    end

    # TODO: Make this helper take a block when the following issue is
    # resolved: https://github.com/github/view_component/issues/1384
    sig { params(text: T.nilable(String), tag: Symbol).returns(String) }
    def label(text = nil, tag: :p)
      content_tag(tag, text, class: component_name("label"))
    end

    private

    sig { returns(T.untyped) }
    attr_reader :link

    sig { returns(T::Hash[Symbol, T.untyped]) }
    attr_reader :link_options

    sig { returns(T::Boolean) }
    def link?
      @link.present?
    end

    sig { returns(T::Boolean) }
    def external_link?
      @external_link
    end
  end

  sig { params(position: Symbol, align: Symbol, kwargs: T.untyped).void }
  def initialize(position: :bottom, align: :left, **kwargs)
    super(**kwargs)
    @position = position
    @align = align
  end

  # == Slots ==
  renders_one :trigger, TriggerComponent
  renders_many :items, ItemComponent
end
