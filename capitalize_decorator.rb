require_relative 'decorator'
class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.capitalize
  end
end
