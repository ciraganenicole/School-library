require './nameable'

class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
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
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
