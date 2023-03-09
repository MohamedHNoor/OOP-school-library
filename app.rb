require_relative './person'
require_relative './book'
require_relative './student'
require_relative './teacher'
require_relative './rental'
require_relative './classroom'
require_relative './nameable'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def list_all_books
    if @books.empty?
      puts 'There is no book available'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people'
    else
      @people.each { |person| puts "Name: #{person.name} Age: #{person.age} Class:#{person.class} ID: #{person.id}" }
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
    puts "Student Created Successfully"
  end

  def create_teacher
    puts 'Specialization:'
    specialization = gets.chomp

    puts 'Age:'
    age = gets.chomp

    puts 'Name:'
    name = gets.chomp

    puts "Has Parent permission? [Y/N]"
    parent_permission = gets.chomp
    
    teacher = Teacher.new(specialization, age, name, parent_permission)
    @people.push(teacher)
    puts "Teacher Created Successfully"
  end

  def create_book
    puts 'Title:'
    title = gets.chomp

    puts 'Author:'
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts "Book Created Successfully"
  end

  def create_rental
    if @books.length.zero?
      puts "No book found"
    elsif @people.length.zero?
      puts "No person found"
    else
      puts "Select a book from the following list by number"
      @books.each_with_index do |book, index|
        puts "#{index.to_i + 1}) Book Title: #{book.title}, Author: #{book.author}"
      end
      rental_book = gets.chomp.to_i - 1

      puts "Select a person from the following list by number"
      @people.each_with_index do |person, index|
        puts "#{index.to_i + 1} Name: #{person.name} Age: #{person.age} Id: #{person.id}"
      end
      rental_person = gets.chomp.to_i - 1

      puts "Please enter the date"
      date = gets.chomp
      rental_detail = Rental.new(date, @books[rental_book], @people[rental_person])
      @rentals.push(rental_detail)
    puts "Rental Created Successfully"
  end

  def list_all_rentals
    if @rentals.empty?
      puts 'There are no rentals'
    else
      puts 'Please type person id'
      id = gets.chomp.to_i
      @rentals.each do |rental|
        puts "Date: #{rental.date}, Book:#{rental.book.title} by #{rental.book.author}"
        end
      end
    end
  end
end
