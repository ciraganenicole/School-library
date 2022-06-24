require './classroom'
require './student'

describe 'should create a classroom' do
  context 'should initialise person class' do
    classroom = Classroom.new(label: 'ss1')
    label = classroom.label
    it 'should be recognized as a person class' do
      expect(classroom.class) == Classroom
    end
    print label
    it 'should give the same value of the label provided' do
      expect(label).to eq label: 'ss1'
    end
  end
end
