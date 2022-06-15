require './person'
require './book'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date

    @person = person
    person.visits << self

    @book = book
    book.visits << self
  end
end