require './student'
require './teacher'
require './rental'

def files
    File.write('./json/book.json', []) unless File.exist?('./json/book.json')
    File.write('./json/person.json', []) unless File.exist?('./json/person.json')
    File.write('./json/rental.json', []) unless File.exist?('./json/rental.json')
end

def books_loaded
    all_books = []
    saved_books = JSON.parse(File.read('./json/book.json'))
  
    saved_books.each do |book|
      all_books << Book.new(book['title'], book['author'])
    end
    all_books
end

def persons_loaded
    all_persons = []
    saved_persons = JSON.parse(File.read('./json/person.json'))
  
    saved_persons.each do |person|

    all_persons << case person['type']

when 'Student'
  Student.new(person['age'], person['name'], person['classroom'], parent_permission: person['parent_permission'])
when 'Teacher'
  Teacher.new(person['age'], person['specialization'], person['name'], parent_permission: person['parent_permission'])
end
end
all_persons
  end

  def rentals_loaded(books, persons)
    all_rentals = []
    saved_rentals = JSON.parse(File.read('./json/rental.json'))
    saved_rentals.each do |rental|
      all_rentals << Rental.new(rental['date'],
                            books.select { |book| book.title == rental['title'] } [0],
                            persons.select { |person| person.name == rental['name'] } [0])
    end
    all_rentals
  end



