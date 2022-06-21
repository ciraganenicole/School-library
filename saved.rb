require './student'
require './teacher'
require './rental'

def data_saved(books, persons, rentals)
  saved_books(books)
  saved_persons(persons)
  saved_rentals(rentals)
end

def saved_books(books)
  all_books = []
  books.each do |book|
    all_books << {
      title: book.title,
      author: book.author
    }
  end

  ruby = JSON.generate(all_books)

  File.write('./json/book.json', ruby.to_s)
end

def saved_persons(persons)
  all_persons = []
  persons.each do |person|
    all_persons << if person.instance_of? Student
                      {
                        json_class: 'Student',
                        name: person.name,
                        age: person.age,
                        classroom: person.classroom,
                        parent_permission: person.parent_permission
                      }
                    elsif person.instance_of? Teacher
                      {
                        json_class: 'Teacher', name: person.name, age: person.age, specialization: person.specialization
                      }
                    end
  end

  ruby = JSON.generate(all_persons)

  File.write('./json/person.json', ruby.to_s)
end

def saved_rentals(rentals)
  all_rentals = []
  rentals.each do |rental|
    all_rentals.push({
                date: rental.date,
                person_id: rental.person.id,
                book_id: rental.book.id,
                name: rental.person.name,
                title: rental.book.title,
                author: rental.book.author
              })
  end

  ruby = JSON.generate(all_rentals)

  File.write('./json/rental.json', ruby)
end