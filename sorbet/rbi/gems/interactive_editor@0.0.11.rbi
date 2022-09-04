# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `interactive_editor` gem.
# Please instead update this file by running `bin/tapioca gem interactive_editor`.

# source://interactive_editor//lib/interactive_editor.rb#11
class InteractiveEditor
  # @return [InteractiveEditor] a new instance of InteractiveEditor
  #
  # source://interactive_editor//lib/interactive_editor.rb#17
  def initialize(editor); end

  # source://interactive_editor//lib/interactive_editor.rb#21
  def edit(object, file = T.unsafe(nil)); end

  # Returns the value of attribute editor.
  #
  # source://interactive_editor//lib/interactive_editor.rb#15
  def editor; end

  # Sets the attribute editor
  #
  # @param value the value to set the attribute editor to.
  #
  # source://interactive_editor//lib/interactive_editor.rb#15
  def editor=(_arg0); end

  # source://interactive_editor//lib/interactive_editor.rb#54
  def execute; end

  class << self
    # source://interactive_editor//lib/interactive_editor.rb#58
    def edit(editor, self_, file = T.unsafe(nil)); end

    # source://interactive_editor//lib/interactive_editor.rb#62
    def find_editor; end
  end
end

# source://interactive_editor//lib/interactive_editor.rb#13
InteractiveEditor::EDITORS = T.let(T.unsafe(nil), Hash)

# source://interactive_editor//lib/interactive_editor.rb#90
module InteractiveEditor::Editors
  # source://interactive_editor//lib/interactive_editor.rb#110
  def ed(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def emacs(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def mate(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def mvim(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def nano(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def nvim(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def subl(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def vi(*args); end

  # source://interactive_editor//lib/interactive_editor.rb#105
  def vim(*args); end
end

# source://interactive_editor//lib/interactive_editor.rb#71
module InteractiveEditor::Exec
  extend ::InteractiveEditor::Exec::MRI
end

# source://interactive_editor//lib/interactive_editor.rb#72
module InteractiveEditor::Exec::Java
  # source://interactive_editor//lib/interactive_editor.rb#73
  def system(file, *args); end
end

# source://interactive_editor//lib/interactive_editor.rb#81
module InteractiveEditor::Exec::MRI
  # source://interactive_editor//lib/interactive_editor.rb#82
  def system(file, *args); end
end

# source://interactive_editor//lib/interactive_editor.rb#12
InteractiveEditor::VERSION = T.let(T.unsafe(nil), String)

class Object < ::BasicObject
  include ::Kernel
  include ::DEBUGGER__::TrapInterceptor
  include ::InteractiveEditor::Editors
end
