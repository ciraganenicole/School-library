require 'json'
require './init'
require 'pry'

class Library
  def initialize
    @books = []
    @people = []
    @rentals = []
    Initialize.new
  end

  def list_all_books
    if @books.empty?
      print 'No books in library'
      return
    end
    @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author: '
    author = gets.chomp.capitalize
    book = Book.new(title: title, author: author)
    # @books << book
    @books << book

    save = []

    @books.each do |bookk|
      save << {
        title: bookk.title,
        author: bookk.author
      }
    end

    save_book = JSON.generate(save)
    File.write('./books.json', save_book.to_s)
    puts "Book created successfully\n"
  end

  def list_all_people
    if @people.empty?
      puts 'Your Library is empty'
      return
    end
    @people.each { |person| puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}\n" }
  end

  def create_rental
    if @people.empty? && @books.empty?
      puts 'Your Library is empty'
      return
    end
    puts 'Select a book by number'
    @books.each_with_index do |book, i|
      print "#{i}) Title: #{book.title}, Author: #{book.author}\n"
    end

    book_index = gets.chomp.to_i
    book = @books[book_index]

    puts 'Select a person by number'
    @people.each_with_index do |person, i|
      print "#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}\n"
    end

    person_index = gets.chomp.to_i
    person = @people[person_index]

    print "\nDate: "

    date = gets.chomp
    rental = Rental.new(date: date, person: person, book: book)
    @rentals << rental
    save = []
    @rentals.each do |rent|
      save << {
        date: rent.date,
        person: rent.person.name,
        book: rent.book.title
      }
    end

    save_rental = JSON.generate(save)
    File.write('./rentals.json', save_rental.to_s)
    puts "Rental created successfully\n"
  end

  def list_all_rental
    print 'ID of person: '
    id = gets.chomp.to_i

    puts 'Rentals: '

    rentals = @rentals.select { |rental| rental.person.id == id }

    if rentals.empty?
      puts 'No rentals found'
      return
    end

    rentals.each do |rental|
      print "Date: #{rental.date}, Book \'#{rental.book.title}\' by #{rental.book.author}\n"
    end
  end

  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Classroom:'
    classroom = gets.chomp
    print 'Has parent permission? [Y/N]: '
    permission_resp = gets.chomp
    parent_permission = permission_resp.downcase == 'y'

    student = Student.new(age: age, classroom: classroom, name: name, parent_permission: parent_permission)
    # @people.push(student)
    print student.class
    @people << student

    save = []
    @people.each do |person|
      save << {
        name: person.name,
        id: person.id,
        age: person.age,
        parent_permission: person.parent_permission
      }
    end

    save_teacher = JSON.generate(save)
    File.write('./people.json', save_teacher.to_s)
    puts "Person created successfuly\n"
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age: age, specialization: specialization, name: name)
    # @people.push(teacher)
    @people.push(teacher)
    save = []
    @people.each do |person|
      save << {
        name: person.name,
        id: person.id,
        age: person.age
      }
    end

    save_teacher = JSON.generate(save)
    File.write('./people.json', save_teacher.to_s)
    puts "Person created successfuly\n"
  end

  def person_create
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    option = gets.chomp

    case option

    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please choose number 1 or 2'
      nil
    end
  end

  def load_books
    return unless File.exist?('./books.json')

    books = JSON.parse(File.read('./books.json'))
    print books.class
    books.each do |book|
      @books << Book.new(title: book['title'], author: book['author'])
    end
  end

  def load_people
    return unless File.exist?('./people.json')

    people = JSON.parse(File.read('./people.json'))
    people.each do |person|
      @people <<
        if person['parent_permission']
          Student.new(age: person['age'], classroom: person['classroom'], name: person['name'],
                      parent_permission: person['parent_permission'])
        else
          Teacher.new(age: person['age'], specialization: person['specialization'], name: person['name'])
        end
    end
  end

  def load_rentals
    return unless File.exist?('./rentals.json')

    rentals = JSON.parse(File.read('./rentals.json'))

    rentals.each do |rental|
      @rentals << Rental.new(date: rental['date'],
                             person: @people.select { |person| person.name == rental['person'] }.first,
                             book: @books.select { |book| book.title == rental['book'] }.first)
    end
  end
end
