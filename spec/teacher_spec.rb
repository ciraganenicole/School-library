require './teacher'

describe Student do
  context 'Text the student class' do
    teacher = Teacher.new(age: 34, specialization: 'Mathmatics', name: 'Roland')

    it 'should have the class of teacher' do
      expect(teacher.instance_of?(Teacher)) == true
    end

    it 'should have the exact age 34, name Tayo and parent permission false' do
      expect(teacher.age).to eq 34
      expect(teacher.name).to eq 'Roland'
    end
  end
end
