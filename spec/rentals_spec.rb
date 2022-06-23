require './rental'
require './book'
require './student'

describe 'should create instance of Rental class' do
  context 'should initialise Rental class' do
    person = Student.new(age: 18, name: 'Tayo', classroom: 'ss1', parent_permission: true)
    book = Book.new(title: 'Rising Sun', author: 'Dire Akanbi')
    rental = Rental.new(date: '01/01/2022', person: person, book: book)

    it 'should be recognized as a person class' do
      expect(rental.class) == Rental
    end

    it 'should give the same value of the rental person' do
      expect(rental.date).to eq '01/01/2022'
      expect(rental.person).to eq person
      expect(rental.book).to eq book
    end
  end
end