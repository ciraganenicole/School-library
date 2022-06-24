require'./classroom'
require './student'
require './book'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Y1_Computer_Science')
  end

  it 'Take the classroom label name and Students' do
    expect(@classroom.label).to eq 'Y1_Computer_Science'
    expect(@classroom.students).to eq []
  end

  it 'Should return two student when adding a student' do
    danny = Student.new(age: 24, name: 'Danny', classroom: 'ss2', parent_permission: true)
    nicolas = Student.new(age: 14, name: 'Nicolas', classroom: 'ss2', parent_permission: false)
    @classroom.add_student(danny)
    @classroom.add_student(nicolas)
    expect(@classroom.students.length).to eql 2
  end

  it 'Should return length one student when adding the multiple students' do
    christian = Student.new(age: 28, name: 'Christian', classroom: 'ss2', parent_permission: true)
    @classroom.add_student(christian)
    @classroom.add_student(christian)
    @classroom.add_student(christian)
    @classroom.add_student(christian)
    @classroom.add_student(christian)
    expect(@classroom.students.length).to eql 5
  end

  it 'Should return the classroom of student when adding students in the classroom' do
    lucas = Student.new(age: 25, name: 'Lucas', classroom: 'ss2', parent_permission: true)
    @classroom.add_student(lucas)
    expect(lucas.classroom).to eq @classroom
  end
end