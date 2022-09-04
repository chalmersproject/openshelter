# typed: true
# frozen_string_literal: true

class LocationInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    merged_input_options =
      merge_wrapper_options(input_html_options, wrapper_options)
    template.render(
      LocationInputComponent.new(
        **options
          .slice(:class)
          .merge(
            form: @builder,
            method: attribute_name,
            options: merged_input_options.merge(options.slice(:value)),
          ),
      ),
    )
  end
end
