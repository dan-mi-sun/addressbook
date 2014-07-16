Address Book
============

A Shoes app that models a basic address book. It will touch on our knowledge of objects, classes and blocks.

# Install

1. fork this repository using the fork button
2. git clone your own version into your projects folder
3. cd into projects/address_book
4. shoes address_book.rb

# TODO

1. Add the following attributes to the Person class, plus anything else that you want to know about your colleagues (don't be nosy...). Finish the implementation of the draw_questions method so that the shoes app prompts for all of the fields.

* email
* github
* twitter
* fun_fact

2. Finish the implementation of the save_values method so that the shoes app populates the values into the person object's attribute accessors and prints them out to the console upon save.

3. Finish the implementation of the ListBox, so that we can create a Trainee or an Instructor, based on the users type selection, using a Factory pattern on the Person class. Don't forget to pass in @form so that the shoes methods will work. Call draw on your new Object to redraw the form when the drop-down list changes.

4. Override methods in Trainee and Instructor so that the extra fields preferred_text_editor and teaching_experience only show up for the correct Person subclass type and are saved when the save button is pressed.

5. Add code to the alphabet buttons, so that when they are clicked the form displays the names of any Person objects saved in the address book. Refactor your logic so that the lookup happens in the Person class. HINT - lookup the Ruby Array API for each, select.

6. Add code to the save button, so that the address book is written out as a YAML file in the current directory called address_book.yml. Is there a Ruby Array API method that can help avoid writing duplicate records?

7. Lookup the Ruby API documentation for the YAML class. Use the load_documents method to populate the address_book array from the address_book.yml file when the app loads up.

8. Add another user type of your own choosing with custom fields and information.

9. Refactor your code so that each Class lives in its own file, so you end up with
four Ruby files.

10. Go around the room and get everyone to input their contact details so you
have a database with everyone's details.
