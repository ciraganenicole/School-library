require './person'

describe 'should create instance of person class' do
  context 'should initialise person class' do
    person = Person.new(age: 18, name: 'Daniel', parent_permission: true)

    it 'should be recognized as a person class' do
      expect(person.class) == Person
    end

    it 'should give the same value of the age, name and parent permission provided' do
      expect(person.age).to eq 18
      expect(person.name).to eq 'Daniel'
      expect(person.parent_permission).to eq true
    end
    it 'should display the name and age of the person' do
      expect(person.name).to eq 'Daniel'
      expect(person.age).to eq 18
    end
  end
  it 'The constructor method sets default value for the optional name parameter if it is not provided' do
    person = Person.new(age: 23)
    expect(person.name).to eql 'Unknown'
  end

  it 'The constructor method sets default value for the optional parent_permission parameter if it is not provided' do
    person = Person.new(age: 23)
    expect(person.parent_permission).to be true
  end

  it 'Should return true if the age is greater or equal than 18 and the parent_permission is true ' do
    person = Person.new(age: 17, name: 'Laurent', parent_permission: true)
    expect(person.can_use_services?).to be true
  end

  it 'Should return nil if the age is less or equal than 18 and the parent_permission is false ' do
    person = Person.new(age: 16, name: 'Laurent', parent_permission: false)
    expect(person.can_use_services?).to be nil
  end

  it 'Should return the name when correct_name is called' do
    person = Person.new(age: 22, name: 'Candy', parent_permission: true)
    expect(person.validate_name).to eql 'Candy'
  end

  it "The add_rental method returns a rental and adds its to the book" do
    book = Book.new(title: "Title", author: "Author")
    person = Person.new(age: 24, name: "Bob")

    rental = person.add_rental(date: "2021-05-04", book: book)

    expect(person.rentals).to eql [rental]
  end
end
