require 'rubygems'
require 'yaml'
require './app/person'
require './app/mrmiyagi'
require './app/instructor'
require './app/trainee'

# We're using an Array as our data store. This the ONE AND ONLY TIME we'll use
# a global variable!
$address_book = []

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
