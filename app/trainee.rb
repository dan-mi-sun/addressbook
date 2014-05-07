require_relative 'person'

class Trainee < Person
  attr_accessor :preferred_text_editor


  def draw_questions
    super
    shoes.flow do
      shoes.caption "Preferred Text Editor"
      @preferred_text_editor_field = shoes.edit_line
    end
  end

  def save_values
    super
    self.preferred_text_editor = @preferred_text_editor_field.text.strip.chomp
  end
end
