require 'json'

class Initialize
  def initialize
    File.write('./rentals.json', []) unless File.exist?('./rentals.json')
    File.write('./books.json', []) unless File.exist?('./books.json')
    File.write('./people.json', []) unless File.exist?('./people.json')
  end
end
