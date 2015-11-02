require_relative 'contact.rb'


class CRM
	def initialize(name)
		@name = name
	end

	def print_main_menu
		puts "1. Add a contact"
		puts "2. Display all contacts"
		puts "3. Display contact"
		puts "4. Display contact attribute"
		puts "5. Delete a contact"
		puts "6. Modify a contact"
		puts "7. Exit"
	end

	def main_menu
		while true
			print_main_menu
			print "Choose an option: "
			user_input = gets.chomp.to_i
			break if user_input == 7
			choose_option(user_input)
		end
	end

	def choose_option(input)
		case input
		when 1 then add_contact
		when 2 then display_all_contacts
		when 3 then display_contact
		when 4 then display_contact_attribute
		when 5 then delete_contact
		when 6 then modify_contact
		else
			"NOT VALID"
		end
	end

	def add_contact
		print "First name: "
		first_name = gets.chomp

		print "Last Name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Notes: "
		notes = gets.chomp

		contact = Contact.create(first_name, last_name, email: email, notes: notes)
	end


	def display_all_contacts
		Contact.all.each do |person|
			puts "#{person.id}: #{person.first_name} #{person.last_name}"

		end
	end

	def display_contact
		print "Which contact do you wish to display? "
		display = gets.chomp.to_i

		Contact.all.each do |other|
			if display == other.id
				puts "#{other.first_name} #{other.last_name}"
			else
				puts "Not a valid contact"
			end
		end
	end

	def display_contact_attribute
	print "Which contact do you wish to display? "
	display = gets.chomp.to_i
	puts "1. Email"
	puts "2. Notes"
	print "Which attribute do you wish to display? "
	att_option = gets.chomp.to_i

	Contact.all.each do |other|
		if display == other.id
			if att_option == 1
				puts "#{other.email}"
			elsif att_option == 2
				puts "#{other.notes}"
			else
				puts"Not a valid contact"
			end
		else
			puts "Not a valid contact"
		end
	end
	end

	def delete_contact
		print "Which contact do you wish to delete? "
		contact_del = gets.chomp.to_i
		print "Are you sure? yes or no: "
		confirmation = gets.chomp

		if confirmation == "yes"
			Contact.all.each do |remove_contact|
				if contact_del == remove_contact.id
					 Contact.all.delete(remove_contact)
				else
					"Not a valid input"
				end

			end
		else
			main_menu
		end
	end

	def modify_contact
		print "Which contact do you wish to modify? "
		contact_mod = gets.chomp.to_i
		print "Are you sure? yes or no: "
		confirmation = gets.chomp
		if confirmation == "yes"
			print "First name: "
			new_first_name = gets.chomp

			print "Last Name: "
			new_last_name = gets.chomp

			print "Email: "
			new_email = gets.chomp

			print "Notes: "
			new_notes = gets.chomp
			Contact.all.each do |new_contact|
				if contact_mod == new_contact.id
					new_contact.first_name = new_first_name
					new_contact.last_name = new_last_name
					new_contact.email = new_email
					new_contact.notes = new_notes
				else
					"Not a valid input"
				end
			end
		else
			main_menu
		end
	end
end

my_awesome_crm = CRM.new('Bitmaker CRM')

my_awesome_crm.main_menu

