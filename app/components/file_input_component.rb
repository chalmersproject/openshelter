# typed: strict
# frozen_string_literal: true

class FileInputComponent < ApplicationComponent
  extend T::Sig

  sig do
    params(
      form: SimpleForm::FormBuilder,
      method: Symbol,
      options: T::Hash[T.any(Symbol, String), T.untyped],
      kwargs: T.untyped,
    ).void
  end
  def initialize(form:, method:, options: {}, **kwargs)
    super(**kwargs)
    @form = form
    @method = method
    @value =
      T.let(
        options.delete(:value),
        T.nilable(
          T.any(
            ActiveStorage::Attachment,
            T.all(Object, T::Enumerable[ActiveStorage::Attachment]),
          ),
        ),
      )
    @options = options
    @attached =
      T.let(@form.object.public_send(@method), ActiveStorage::Attached)
  end

  private

  sig { returns(SimpleForm::FormBuilder) }
  attr_reader :form
  alias_method :f, :form

  sig { returns(Symbol) }
  attr_reader :method

  sig { returns(T::Hash[T.any(Symbol, String), T.untyped]) }
  attr_reader :options

  sig { returns(T::Boolean) }
  def multiple?
    @attached.is_a?(ActiveStorage::Attached::Many)
  end

  sig do
    returns(T.all(Object, T::Enumerable[T.nilable(ActiveStorage::Attachment)]))
  end
  def attachments
    if @value
      attachments =
        case @value
        when ActiveStorage::Attachment
          [@value]
        else
          @value
        end
      return attachments
    end

    case @attached
    when ActiveStorage::Attached::One
      [@attached.attachment].compact
    when ActiveStorage::Attached::Many
      @attached.attachments || []
    else
      raise "invalid attachment representation"
    end
  end

  sig { returns(T::Array[T::Hash[Symbol, String]]) }
  def attachments_data
    attachments.map do |attachment|
      blob = attachment&.blob
      signed_id = blob&.signed_id
      filename = blob&.filename
      url = url_for(blob.representation(resize_to_limit: [512, 512])) if blob
        &.representable?
      data = { "signedId": signed_id, filename: filename, url: url }
      data.compact
    end
  end
end
