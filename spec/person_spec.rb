require './person'

describe 'should create instance of person class' do
  context 'should initialise person class' do
    person = Person.new(age: 18, name: 'Daniel', parent_permission: true)

    it 'should be recognized as a person class' do
      expect(person.class) == Person
    end

    it 'should give the same value of the age, name and parent permission provided' do
      expect(person.age).to eq 18
      expect(person.name).to eq 'Daniel'
      expect(person.parent_permission).to eq true
    end
    it 'should display the name and age of the person' do
      expect(person.name).to eq 'Daniel'
      expect(person.age).to eq 18
    end
  end
end