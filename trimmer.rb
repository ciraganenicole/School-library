require './decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name.length > 10 ? @nameable.correct_name[0..9] : @nameable.correct_name
  end
end
