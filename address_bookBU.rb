require 'rubygems'
require 'yaml'

# We're using an Array as our data store. This the ONE AND ONLY TIME we'll use
# a global variable!
$address_book = []

# A Person represents an individual that we want to store contact information
# for, the superclass of Trainee and Instructor
#
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

Shoes.app title: "Ruby Address Book", width: 520 do
  background rgb(240, 250, 208)
  begin
    File.open("address_book.yml") do |f|
      YAML.load_documents(f) do |yf|
        $address_book = yf
      end
    end
  end

  # The row of buttons to lookup Person objects in the address_book
  ('A'..'Z').each do |letter|
    flow width: 40 do
      button letter do
        # TODO 5. Show each of the Person objects in the address_book where the
        # last name matches.
        Person.find_contact(letter) do |contact|

          print "#{contact.first_name} #{contact.last_name}"

        end
      end
    end
  end

  stack margin: 20 do
    flow do
      caption "Type"
      list_box :items => %w(Trainee Instructor MrMiyagi) do |selected|
        #    binding.pry
        debug selected.text
        @person = Person.make_person(selected.text, @form) 
        @person.draw 

        # TODO 3. Create a Trainee or an Instructor using a Person factory method
        # and store the result in @person. Show the fields for the user to fill in
        @person = Person.make_person(selected.text, @form)
        @person.draw
      end
    end

    # This reserves space for the form elements to be appended later by the
    # draw method
    @form = stack

    # Actually draw the form using Trainee as a default
    @person = Trainee.new(@form)
    @person.draw
  end

end
