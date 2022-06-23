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
  end
end