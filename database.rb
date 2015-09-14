require_relative 'person'
require_relative 'student'
require_relative 'employee'

class Database
  def initialize
    @people = []

    byron = Student.new
    byron.name = "byron"
    byron.phone_number = "3522817726"
    byron.address = "410 s armenia Ave"
    byron.slack = "byronroark"
    byron.github = "byronroark"

    sanam = Student.new
    sanam.name = "sanam"
    sanam.phone_number = "8504640576"
    sanam.address = "319 SE madison street"
    sanam.slack = "sanamakbar"
    sanam.github = "sanamakbar"

    gavin = Employee.new
    gavin.name = "gavin"
    gavin.phone_number = "5559733023"
    gavin.address = "206 S 1st street"
    gavin.position = "instructor"
    gavin.salary = "500000000"
    gavin.date_hired = "09151988"
    gavin.slack = "gavinstark"
    gavin.github = "gavinstark"

    jason = Employee.new
    jason.name = "jason"
    jason.address = "203 west 5th"
    jason.position = "instructor"
    jason.salary = "3000000"
    jason.date_hired = "09151988"
    jason.slack = "jasonparker"
    jason.github = "jasonparker"


    @people = [byron, sanam, gavin, jason]
  end

  def search_person(name)
    person = @people.find { |person| person.name.include?(name) }
    if person
      puts "Name: #{person.name.capitalize}"
      puts "Address: #{person.address}"
      puts "Phone number: #{person.phone_number}"
      puts "Github: #{person.github}"
      puts "Slack: #{person.slack}"
    else
      puts "Could not find a match."
    end
  end

  def delete_person(name)
    person = @people.find { |person| person.name.include?(name) }
    if person
      puts "#{name} has been deleted."
      @people.delete(person)
    else
      puts "#{name} not found."
    end
  end

  def add_student(name)
    puts "The person's name is #{name}"
    person = Student.new
    person.name = name
    puts "Please enter #{name}'s address:"
    person.address = gets.chomp
    puts "#{name}'s address is #{person.address}."
    puts "Please enter #{name}'s phone number:"
    person.phone_number = gets.chomp
    puts "#{name}'s phone number is #{person.phone_number}."
    puts "Please enter #{name}'s Slack account:"
    person.slack = gets.chomp
    puts "#{name}'s Slack account is #{person.slack}."
    puts "Please enter #{name}'s Github account:"
    person.github = gets.chomp
    puts "#{name}'s Github account is #{person.github}."
    @people = person
    p @people
  end

  def add_employee(name)
    puts "The person's name is #{name}"
    person = Employee.new
    person.name = name
    puts "Please enter #{name}'s address:"
    person.address = gets.chomp
    puts "#{name}'s address is #{person.address}."
    puts "Please enter #{name}'s phone number:"
    person.phone_number = gets.chomp
    puts "#{name}'s phone number is #{person.phone_number}."
    puts "Please enter #{name}'s position:"
    person.position = gets.chomp
    puts "#{name}'s position is #{person.position}."
    puts "Please enter #{name}'s salary:"
    person.salary = gets.chomp
    puts "#{name}'s salary is #{person.salary}."
    puts "Please enter #{name}'s date of hire:"
    person.date_hired = gets.chomp
    puts "#{name}'s date of hire is #{person.date_hired}."
    puts "Please enter #{name}'s Slack account:"
    person.slack = gets.chomp
    puts "#{name}'s Slack account is #{person.slack}."
    puts "Please enter #{name}'s Github account:"
    person.github = gets.chomp
    puts "#{name}'s Github account is #{person.github}."
    @people = person
    p @people
  end
end

database = Database.new
puts "Welcome. You can Add a person, Search for person, or Delete a person, Enter Q to exit."
loop do
  puts "What's your choice? (A)dd person/(S)earch Person/(D)elete Person/(Q)uit:"
  choice = gets.chomp.upcase
  if choice == "A"
  puts "You chose to add a person."
  puts "Is this person a (S)tudent or (E)mployee?"
  role = gets.chomp.upcase
    if role == "S"
      puts "Please enter the Student's name:"
      name = gets.chomp
      database.add_student(name)
    elsif role == "E"
      puts "Please enter the Employee's name:"
      name = gets.chomp
      database.add_employee(name)
    else
      puts "You entered an invalid choice. Please choose again."
    end
  elsif choice == "S"
    puts "You chose to search for someone."
    puts "What is person's name?"
    name = gets.chomp
    database.search_person(name)
  elsif choice == "D"
    puts "You have chosen to delete someone."
    puts "What is person's name?"
    name = gets.chomp
    database.delete_person(name)
  elsif choice == "Q"
    puts "Now quitting program. Ok. Goodbye."
  else
    puts "You entered an invalid character. Try again."
  end
end
