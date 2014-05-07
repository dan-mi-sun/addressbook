
require_relative 'person'

class Instructor < Person
  attr_accessor :teaching_experience

  def draw_questions
    super
    shoes.flow do
      shoes.caption "Teaching Experience"
      @teaching_experience_field = shoes.edit_line
    end
  end

  def save_values
    super
    self.teaching_experience = @teaching_experience_field.text.strip.chomp
  end
end
