require 'json'
require './init'
require 'pry'
require './list'

class Library < List
  def initialize
    super()
    @books = []
    @people = []
    @rentals = []
    Initialize.new
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
