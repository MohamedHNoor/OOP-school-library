require_relative './classes/person'
require_relative './classes/book'
require_relative './classes/student'
require_relative './classes/teacher'
require_relative './classes/rental'
require_relative './classes/classroom'
require_relative './classes/nameable'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
    @input = nil
    @options = ['List all books', 'List all people', 'Create a person', 'Create a book', 'Create a rental',
                'List all rentals for a given person id', 'Exit']
  end

  def run
    loop do
      options
      adjust_input
      validate_input(1, 7)
      action
    end
  end

  def options
    puts 'Please choose an option by entering a number:'
    @options.each_with_index { |option, index| puts "#{index + 1}) #{option}" }
  end

  def adjust_input
    @input = gets.chomp.to_i
  end

  def validate_input(min, max)
    return unless @input < min || @input > max

    puts 'Invalid input, please try again'
    options
    adjust_input
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def action
    case @input
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_all_rentals
    when 7
      puts 'Thank you for using this app!'
      exit
    end
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  def list_all_books
    if @books.empty?
      puts 'There is no book available'
    else
      puts("----------------------------------------------------\n")
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
      puts("----------------------------------------------------\n")
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people'
    else
      puts("----------------------------------------------------\n")
      @people.each { |person| puts "Name: #{person.name} Age: #{person.age} Class:#{person.class} ID: #{person.id}" }
      puts("----------------------------------------------------\n")
    end
  end

  def create_person
    puts 'Do you want to  create a student (1) or a teacher(2)?'
    input_result = gets.chomp.to_i

    case input_result
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    puts 'Classroom'
    classroom = gets.chomp

    puts 'Age:'
    age = gets.chomp

    puts 'Name:'
    name = gets.chomp

    puts 'Has Parent permission? [Y/N]'
    parents_permission = gets.chomp

    student = Student.new(classroom, age, name, parents_permission)
    @people.push(student)
    puts 'Student Created Successfully'
  end

  def create_teacher
    puts 'Specialization:'
    specialization = gets.chomp

    puts 'Age:'
    age = gets.chomp

    puts 'Name:'
    name = gets.chomp

    puts 'Has Parent permission? [Y/N]'
    parent_permission = gets.chomp

    teacher = Teacher.new(specialization, age, name, parent_permission)
    @people.push(teacher)
    puts 'Teacher Created Successfully'
  end

  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'Book Created Successfully'
  end

  def create_rental
    if @books.empty?
      puts 'No book record found'
    elsif @people.empty?
      puts 'No person record found'
    else
      puts 'Select a book from the following list by number:'
      @books.each_with_index do |book, index|
        puts "#{index.to_i + 1}) Book Title: #{book.title}, Author: #{book.author}"
      end
      rental_book = gets.chomp.to_i - 1
      puts 'Select a person from the following list by number:'
      @people.each_with_index do |person, index|
        puts "#{index.to_i + 1}) Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i - 1
      puts 'Please enter the date:'
      date = gets.chomp
      rental_detail = Rental.new(date, @books[rental_book], @people[rental_person])
      @rentals.push(rental_detail)
      puts 'Rental created successfully'
    end
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'There are no rentals'
    else
      puts 'Please type person id'
      id = gets.chomp.to_i
      @rentals.each do |rental|
        puts("----------------------------------------------------\n")
        puts "Date: #{rental.date}, Book:#{rental.book.title} by #{rental.book.author}" if rental.person.id == id
        puts("----------------------------------------------------\n")
      end
    end
  end
end
