#!/usr/bin/env ruby
# rubocop:disable Style/CyclomaticComplexity
require './app'

def main
  puts "Welcome to Library App!\n\n "
  response = nil
  app = Library.new

  while response != '7'
    puts 'Please choose an option below :'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'

    response = gets.chomp

    puts "\n"

    case response
    when '1'
      app.list_all_books
    when '2'
      app.list_all_people
    when '3'
      app.create_person
    when '4'
      app.create_book
    when '5'
      app.create_rental
    when '6'
      app.list_all_rental
    when '7'
      puts 'Exit'
    end
    puts "\n"
  end
end

main
# rubocop:enable Style/CyclomaticComplexity
