require './capitalize_decorator'
require './trimmer'
require './decorator'

describe TrimmerDecorator do
  context 'When testing decorator classes' do
    it 'Should return a string capitalized' do
      person = Decorator.new('maximilianus')
      expect(person.correct_name.capitalize).to eq 'Maximilianus'
    end

    it 'Should return only the 10 characheres of the name' do
      person = Decorator.new('maximilianus')
      expect(person.correct_name).to eq 'maximilianus'
    end
  end
end