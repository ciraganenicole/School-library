require './student'

describe Student do
  context 'Text the student class' do
    student = Student.new(age: 18, name: 'Tayo', classroom: 'ss1', parent_permission: true)

    it 'should have the class of student' do
      expect(student.instance_of?(Student)) == true
    end

    it 'should have the exact age 14, name Tayo and parent permission false' do
      expect(student.age).to eq 18
      expect(student.name).to eq 'Tayo'
      expect(student.parent_permission).to eq true
      expect(student.classroom).to eq 'ss1'
    end

    it 'should display all the students' do
      people = [{ name: 'Mwafrika', id: 12, age: 23 }, { name: 'Josue', id: 13, age: 20 }]
      expect(people).to eq [{ name: 'Mwafrika', id: 12, age: 23 }, { name: 'Josue', id: 13, age: 20 }]
      expect(people.length).to eq 2
      expect(people[0][:name]).to eq 'Mwafrika'
      expect(people[0][:age]).to eq 23
      expect(people[1][:name]).to eq 'Josue'
      expect(people[1][:age]).to eq 20
    end
  end
end