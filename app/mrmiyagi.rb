require_relative 'person'

class MrMiyagi < Person
  attr_accessor :watering_the_bonsai


  def draw_questions
    super
    shoes.flow do
      shoes.caption "Water the Bonsai?"
      @watering_the_bonsai_field = shoes.edit_line
    end
  end

  def save_values
    super
    self.watering_the_bonsai= @watering_the_bonsai_field.text.strip.chomp
  end
end
