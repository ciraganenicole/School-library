require_relative 'rental'
require 'pry'

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title:, author:)
    @title = title
    @author = author
    @rentals = []
  end

  # Added
  def add_rental(date, person)
    Rental.new(date: date, person: person, book: self)
  end
end
