require './nameable'
require './rental'

class Person < Nameable
  def initialize(age:, name: 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000).to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    super()
  end

  attr_accessor :name, :age
  attr_reader :id

  private

  def of_age?
    @age >= 18
  end

  def can_use_services?
    return true if of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
