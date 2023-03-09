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
      puts 'There is no book'
    else
      @books.eack { |book| puts "#{book.title} written by #{book.author}" }
    end
  end

  def list_all_people
    if @people.empty?
      puts 'There is no people'
    else
      @people.each { |person| puts "Name:#{person.name} Age:#{person.age} Class:#{person.class} ID:#{person.id}" }
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

    def create_student
      puts 'Name:'
      name = gets.chomp

      puts 'Age:'
      age = gets.chomp

      puts 'has Parent permission? [Y/N]'
      parent_permission = gets.chomp

      puts 'Classroom'
      classroom = gets.chomp

      student = Student.new(classroom, age, name, parent_permission)
      @people.push(student)
    end

    def create_teacher
      puts 'Age:'
      age = gets.chomp

      puts 'Name:'
      name = gets.chomp

      puts 'Specialization:'
      specialization = gets.chomp
    end

    def create_book
      puts 'Title:'
      title = gets.chomp

      puts 'Author:'
      author = gets.chomp

      book = Book.new(title, author)
      @books.push(book)
    end

    def create_rental
      puts 'Date(yyy/dd/mm)'
      date = gets.chomp

      puts 'Select a book'
      @books.each_with_index { |book, index| puts "#{index} #{book.title} written by #{book.author}" }
      book_id = gets.chomp.to_i
      book = @books[book_id]

      puts 'Select a person'
      @people.each_with_index { |person, index| puts "#{index} #{person.name}" }
      person_id = gets.chomp.to_i
      person = @people[person_id]

      rental = Rental.new(date, book, person)
      @rentals.push(rental)
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
