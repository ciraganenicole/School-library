require './book'

describe 'Check if instance of class Book is true' do
  context 'should create new class books' do
    book = Book.new(title: 'Rising Sun', author: 'Dire Akanbi')

    it 'should have class book' do
      expect(book.class) == Book
    end

    it 'should have the correct title and author' do
      expect(book.title).to eq 'Rising Sun'
      expect(book.author).to eq 'Dire Akanbi'
    end

    it 'The add_rental method returns a rental and adds its to the book rentals' do
      person = Person.new(age: 17, name: 'Bob', parent_permission: true)
      book = Book.new(title: 'Mind Prey', author: 'John Sandford')

      person.add_rental('2022-03-05', book)
      expect(book.rentals.length).to eql 1
    end
  end
end
