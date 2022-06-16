require './decorator'

class TrimmerDecorator
  def correct_name(name)
    name = name[0...10] if name.length > 10
    name.capitalize
  end
end
