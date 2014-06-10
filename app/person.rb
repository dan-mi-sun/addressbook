
class Person

  attr_accessor :shoes
  attr_accessor :first_name
  attr_accessor :last_name
  attr_accessor :email
  attr_accessor :github
  attr_accessor :twitter
  attr_accessor :fun_fact

  # TODO 1. Add more! DONE

  def initialize(shoes)
    self.shoes = shoes
  end

  # Displays the input form to the user
  #
  def self.make_person(selected, form) 
    case selected
    when "Trainee"
      Trainee.new(form)
    when "Instructor"
      Instructor.new(form)
    when "MrMiyagi"
      MrMiyagi.new(form)
    end
  end

  def self.find_contact(name)
    debug $address_book
    $address_book.select do |contact|

      if contact.last_name[0]  == name
        yield contact
      end
    end
  end

  def draw
    shoes.clear
    shoes.append do
      # Show the questions on the screen
      draw_questions

      shoes.button "Save" do
        # Set the values from the boxes into the Object
        save_values

        # Append ourselves to our address_book Array
        $address_book << self

        # TODO: 6. Open a address_book.yml YAML file and write it out to disc
        shoes.debug self.to_yaml
        begin
          File.open("address_book.yml", "w") { |f| f.write $address_book.to_yaml }
        end

        shoes.alert 'Saved'
      end
    end
  end

  # Renders some labels and textboxes to prompt the user for input
  
  def draw_questions
    shoes.flow do
      shoes.caption "First name"
      @first_name_field = shoes.edit_line
    end

    shoes.flow do
      shoes.caption "Last name"
      @last_name_field = shoes.edit_line
    end
    
    shoes.flow do
      shoes.caption "Email"
      @email_field = shoes.edit_line
    end

    shoes.flow do
      shoes.caption "Github"
      @github_field = shoes.edit_line
    end

    shoes.flow do
      shoes.caption "Twitter"
      @twitter_field = shoes.edit_line
    end

    shoes.flow do
      shoes.caption "Fun fact"
      @fun_fact_field = shoes.edit_line
    end

    # TODO 4. Add fields for the user to fill in, but only if they are
    # relevant to the given user type.
  end

  # Set the persons's name to the contents of the text box
  #
  def save_values
    self.first_name = @first_name_field.text.strip.chomp
    self.last_name = @last_name_field.text.strip.chomp
    self.email = @email_field.text.strip.chomp
    self.github = @github_field.text.strip.chomp
    self.twitter = @twitter_field.text.strip.chomp
    self.fun_fact = @fun_fact_field.text.strip.chomp

    # TODO: 2. Finish the implementation to set the other fields. DONE
  end
end
