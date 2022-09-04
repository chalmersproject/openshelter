# typed: true
# frozen_string_literal: true

class TextInput < SimpleForm::Inputs::TextInput
  def input_html_options
    controller = "textarea-autogrow" unless options[:autogrow] == false
    super.merge(data: { controller: controller }, **options.slice(:placeholder))
  end
end
