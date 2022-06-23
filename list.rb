class List
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
end
